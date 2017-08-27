#! /bin/bash

echo 'cd ~/.myshell'
cd ~/.myshell



echo 'git submodule init'
git submodule init



echo 'git submodule update'
git submodule update



case "$OSTYPE" in
  solaris*)
    echo "SOLARIS" ;;
  darwin*)
    echo "OSX"
    echo 'brew install gawk'
    brew install gawk
    ;; 
  linux*)
    echo "LINUX"
    ;;
  bsd*) 
    echo "BSD" ;;
  msys*) 
    echo "WINDOWS" ;;
  *)
    echo "unknown: $OSTYPE" ;;
esac



if [ -e $HOME/.bash_profile ]
then
    grepResult=$(cat $HOME/.bash_profile | grep PATH | grep myshell)
    echo $HOME/.bash_profile $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export PATH=$PATH:$HOME/.myshell:' >> $HOME/.bash_profile
    fi
fi



if [ -e $HOME/.bashrc ]
then
    grepResult=$(cat $HOME/.bashrc | grep PATH | grep myshell)
    echo $HOME/.bashrc $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export PATH=$PATH:$HOME/.myshell:' >> $HOME/.bashrc
    fi
fi



if [ -e $HOME/.profile ]
then
    grepResult=$(cat $HOME/.profile | grep PATH | grep myshell)
    echo $HOME/.profile $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export PATH=$PATH:$HOME/.myshell:' >> $HOME/.profile
    fi
fi



if [ -e $HOME/.zshrc ]
then
    grepResult=$(cat $HOME/.zshrc | grep PATH | grep myshell)
    echo $HOME/.zshrc $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export PATH=$PATH:$HOME/.myshell:' >> $HOME/.zshrc
    fi
fi
