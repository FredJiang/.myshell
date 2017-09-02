#! /bin/bash

echo 'cd ~/.myshell'
cd ~/.myshell



echo 'git submodule init'
git submodule init



echo 'git submodule update'
git submodule update



function install_gawk {
    if which gawk > /dev/null
    then
        echo 'gawk has installed'
    else
        if which apt-get > /dev/null
        then
            echo 'sudo apt-get install -y gawk'
            sudo apt-get install -y gawk
        fi

        if which yum > /dev/null
        then
            echo 'sudo yum install -y gawk'
            sudo yum install -y gawk
        fi

        if which brew >/dev/null
        then
            echo 'brew install gawk'
            brew install gawk
        fi
    fi
}

install_gawk

case "$OSTYPE" in
  solaris*)
    echo "SOLARIS" ;;
  darwin*)
    echo "OSX"
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



# if [ -e $HOME/.bash_profile ]
# then
#     grepResult=$(cat $HOME/.bash_profile | grep PATH | grep myshell)
#     echo $HOME/.bash_profile $grepResult
#     if [ ${#grepResult} == 0 ]
#     then
#         echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.bash_profile
#     fi
# fi



# if [ -e $HOME/.bashrc ]
# then
#     grepResult=$(cat $HOME/.bashrc | grep PATH | grep myshell)
#     echo $HOME/.bashrc $grepResult
#     if [ ${#grepResult} == 0 ]
#     then
#         echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.bashrc
#     fi
# fi



# if [ -e $HOME/.profile ]
# then
#     grepResult=$(cat $HOME/.profile | grep PATH | grep myshell)
#     echo $HOME/.profile $grepResult
#     if [ ${#grepResult} == 0 ]
#     then
#         echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.profile
#     fi
# fi



if [ -e $HOME/.zshrc ]
then
    grepResult=$(cat $HOME/.zshrc | grep PATH | grep myshell)
    echo $HOME/.zshrc $grepResult
    if [ ${#grepResult} == 0 ]
    then
        echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.zshrc
    fi
fi
