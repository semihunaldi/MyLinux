
#export M2_HOME=/Users/semihunaldi/Documents/DEV/Programs/apache-maven-3.3.9
#export PATH=$PATH:$M2_HOME/bin
#export USER_MEM_ARGS="-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

PS1="\[$(tput bold)\]\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\h \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias editbashprofile="subl ~/.bash_profile"
alias mongo="/Users/semihunaldi/DEV/DEV_PROGRAMS/mongodb-osx-x86_64-3.4.9/bin/mongod --dbpath /Users/semihunaldi/DEV/DEV_PROGRAMS/dataDB"
alias idea="/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea"

alias sshHomeServerLocal="ssh -i /ssh-key.pem user@host.com"
alias sshHomeServerRemote="ssh -i /ssh-key.pem user@host.com 27"
alias sshsemih="ssh -i /ssh-key.pem user@host.com"

alias src="source ~/.bash_profile"


#alias cdphp="cd /Users/tanersenyurt/Development/Projects/php/"
#alias cdcc="cd /Users/tanersenyurt/Documents/CC"
#alias art="php artisan"
#alias arts="php artisan serve"
#alias startdb="mysql.server start"
#alias stopdb="mysql.server stop"
#alias updatedb="php artisan migrate:refresh --seed"
#alias starth2="sh /Users/tanersenyurt/Development/programs/h2/bin/h2.sh"
#alias sh2="sh /Users/tanersenyurt/Development/programs/h2/bin/h2copy.sh"
alias edithosts="subl /private/etc/hosts"
#alias jdkhome="/usr/libexec/java_home  -V"
#alias jdk7wsimport="/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home/bin/wsimport"
#alias jdk7java="/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home/bin/java"
#alias idgen="uuidgen|tr -d '\n'|pbcopy&&pbpaste&&printf '\n'"
alias l='ls -al'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
#alias ..='cd ../'                           # Go back 1 directory level
#alias ...='cd ../../'                       # Go back 2 directory levels
#alias .3='cd ../../../'                     # Go back 3 directory levels
#alias .4='cd ../../../../'                  # Go back 4 directory levels
#alias .5='cd ../../../../../'               # Go back 5 directory levels
#alias .6='cd ../../../../../../'            # Go back 6 directory levels
#alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
#alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
#alias which='type -all'                     # which:        Find executables
#alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
#alias show_options='shopt'                  # Show_options: display bash options settings
#alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
#alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias cwd='pwd | pbcopy'                    # cwd:          Copy the working directory into the clipboard

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -delete"
alias clean="find . -name '*.DS_Store' -type f -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

toggleHidden () {
    SHOWS_HIDDEN=$(defaults read com.apple.finder AppleShowAllFiles);

    SET_TO="NO"

    if [ $(echo $SHOWS_HIDDEN | egrep "(YES|TRUE)" | wc -l) -eq 0 ]; then
        SET_TO="YES"
    fi

    defaults write com.apple.finder AppleShowAllFiles $SET_TO
    killall -HUP Finder
    echo $(defaults read com.apple.finder AppleShowAllFiles);
}

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


function killport() {
if [ -z "$1" ]; then
    echo "Usage: killport [numeric port identifier]" >&2
    return 1
fi
  lsof -i TCP:$1 | awk '/LISTEN/{print $2}' | xargs kill -9
  #lsof -t -i tcp:8000 | xargs kill
  echo "Port" $1 "found and killed."
}


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo "You are logged on ${RED}$HOST"
        echo "Additionnal information:$NC " ; uname -a
        echo "${RED}Users logged on:$NC " ; w -h
        echo "${RED}Current date :$NC " ; date
        echo "${RED}Machine stats :$NC " ; uptime
        echo "${RED}Current network location :$NC " ; scselect
        #echo "${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------
#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

    dnslookup () { nslookup -q=A "$@" 8.8.8.8 ; }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

    edit()
    {
      subl $1
    }

cicOn()
{
    # If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
    if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

    # Add option to ~/.inputrc to enable case-insensitive tab completion
    echo 'set completion-ignore-case On' >> ~/.inputrc
}

cicOff()
{
    # If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
    if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

    # Add option to ~/.inputrc to enable case-insensitive tab completion
    echo 'set completion-ignore-case Off' >> ~/.inputrc
}

## how to write iso to usb flash drive
# ::::::
## find your disk ex: disk2
# diskutil list
# diskutil unmount /dev/disk2
#
### Note the 'r' added to rdisk2 which drastically improves write performance by telling dd to operate in raw disk mode
# sudo dd if=/path/iso-file of=/dev/rdisk2 bs=1m
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#



