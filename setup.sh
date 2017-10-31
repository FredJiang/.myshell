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


function install_gawk {
    if which gawk > /dev/null; then
        echoMe 'gawk has installed'
    else
        if which apt-get > /dev/null; then
            echoCo 'sudo apt-get install -y gawk'
                    sudo apt-get install -y gawk
        fi

        if which yum > /dev/null; then
            echoCo 'sudo yum install -y gawk'
                    sudo yum install -y gawk
        fi

        if which brew >/dev/null; then
            echoCo 'brew install gawk'
                    brew install gawk
        fi
    fi
}


install_gawk


function install_shellcheck {
    if which shellcheck > /dev/null; then
        echoMe 'shellcheck has installed'
    else
        if which apt-get > /dev/null; then
            echoCo 'sudo apt-get install -y shellcheck'
                    sudo apt-get install -y shellcheck
        fi

        if which yum > /dev/null; then
            echoCo 'sudo yum install -y epel-release'
                    sudo yum install -y epel-release
            echoCo 'sudo yum install -y ShellCheck'
                    sudo yum install -y ShellCheck
        fi

        if which brew >/dev/null; then
            echoCo 'brew install shellcheck'
                    brew install shellcheck
        fi
    fi
}


install_shellcheck


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


if [ -e ~/.bash_profile ]; then
    echoCo      'cat ~/.bash_profile | grep PATH | grep myshell'
    grepResult=$(cat ~/.bash_profile | grep PATH | grep myshell)
    echo $grepResult
    if [ ${#grepResult} == 0 ]; then
        echoCo $'echo \'export PATH=$PATH:~/.myshell\' >> ~/.bash_profile'
                 echo 'export PATH=$PATH:~/.myshell' >> ~/.bash_profile
    fi
fi


if [ -e ~/.bashrc ]; then
    echoCo      'cat ~/.bashrc | grep PATH | grep myshell'
    grepResult=$(cat ~/.bashrc | grep PATH | grep myshell)
    echo $grepResult
    if [ ${#grepResult} == 0 ]; then
        echoCo $'echo \'export PATH=$PATH:~/.myshell\' >> ~/.bashrc'
                 echo 'export PATH=$PATH:~/.myshell' >> ~/.bashrc
    fi
fi


if [ -e ~/.profile ]; then
    echoCo      'cat ~/.profile | grep PATH | grep myshell'
    grepResult=$(cat ~/.profile | grep PATH | grep myshell)
    echo $grepResult
    if [ ${#grepResult} == 0 ]; then
        echoCo $'echo \'export PATH=$PATH:~/.myshell\' >> ~/.profile'
                 echo 'export PATH=$PATH:~/.myshell' >> ~/.profile
    fi
fi


if [ -e ~/.zshrc ]; then
    echoCo      'cat ~/.zshrc | grep PATH | grep myshell'
    grepResult=$(cat ~/.zshrc | grep PATH | grep myshell)
    echo $grepResult
    if [ ${#grepResult} == 0 ]; then
        echoCo $'echo \'export PATH=$PATH:~/.myshell\' >> ~/.zshrc'
                 echo 'export PATH=$PATH:~/.myshell' >> ~/.zshrc
    fi
fi

