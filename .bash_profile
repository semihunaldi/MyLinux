source ~/.bashrc

alias editbashprofile="sudo nano ~/.bash_profile"

alias edit="sudo nano"

alias l="ls -al"

alias myip="curl ifconfig.me"

alias checkdiskspace="df"
alias listdisk="lsblk"

alias shut="sudo shutdown -h now"
alias rebo="sudo reboot"

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)

alias restartNetwork="sudo /etc/init.d/network restart"


alias killdeluge="sudo pkill deluged"

alias c='clear'                             # c:            Clear terminal display
#alias which='type -all'                     # which:        Find executables
#alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside

alias cwd='pwd | pbcopy'                                        # cwd:                  Copy the working direct$

########################Debian#####################
#alias ifconfig="sudo /sbin/ifconfig"

###################################################


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
	
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
     PS1="\[$(tput bold)\]\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\h \[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
else
     PS1="\u@\h \w\\$ \[$(tput sgr0)\]"
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
 
setDate() {
 sudo date -u --set="$(curl -H 'Cache-Control: no-cache' -sD - http://google.com |grep '^Date:' |cut -d' ' -f3-6)"
}

