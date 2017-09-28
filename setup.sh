#! /bin/bash


function echoCo {
    echo -e "\033[32m$@\033[0m"
}


function echoMe {
    echo -e "\033[35m$@\033[0m"
}


echoCo 'git pull'
        git pull


echoCo 'git submodule init'
        git submodule init


echoCo 'git submodule update'
        git submodule update


echoCo 'cd ~/.myshell'
        cd ~/.myshell


function install_gawk {
    if which gawk > /dev/null
    then
        echoMe 'gawk has installed'
    else
        if which apt-get > /dev/null
        then
            echoCo 'sudo apt-get install -y gawk'
                    sudo apt-get install -y gawk
        fi

        if which yum > /dev/null
        then
            echoCo 'sudo yum install -y gawk'
                    sudo yum install -y gawk
        fi

        if which brew >/dev/null
        then
            echoCo 'brew install gawk'
                    brew install gawk
        fi
    fi
}


install_gawk


case "$OSTYPE" in
  solaris*)
    echoMe "SOLARIS"
    ;;
  darwin*)
    echoMe "OSX"
    ;; 
  linux*)
    echoMe "LINUX"
    ;;
  bsd*) 
    echoMe "BSD"
    ;;
  msys*) 
    echoMe "WINDOWS"
    ;;
  *)
    echoMe "unknown: $OSTYPE"
    ;;
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
    echoMe $HOME/.zshrc $grepResult

    if [ ${#grepResult} == 0 ]
    then
        echoCo "echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.zshrc"
                echo 'export PATH=$PATH:$HOME/.myshell' >> $HOME/.zshrc
    fi
fi
