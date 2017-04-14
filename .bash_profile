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


