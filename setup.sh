#! /bin/bash


function echoCo {
    echo -e "\033[32m$@\033[0m"
}


function echoMe {
    echo -e "\033[35m$@\033[0m"
}


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


function install_axel {
    if which axel > /dev/null; then
        echoMe 'axel has installed'
    else
        if which apt-get > /dev/null; then
            echoCo 'sudo apt-get install -y axel'
                    sudo apt-get install -y axel
        fi

        if which yum > /dev/null; then
            # # CentOS release 6.9 (Final)
            # wget ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/axel-2.4-1.el6.rf.x86_64.rpm
            # sudo rpm -ivh axel-2.4-1.el6.rf.x86_64.rpm
            echoCo 'sudo rpm -ivh ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/axel-2.4-1.el6.rf.x86_64.rpm'
                    sudo rpm -ivh ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/axel-2.4-1.el6.rf.x86_64.rpm
        fi

        if which brew >/dev/null; then
            echoCo 'brew install axel'
                    brew install axel
        fi
    fi
}


install_axel


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
