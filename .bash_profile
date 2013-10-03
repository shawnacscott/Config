export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export CC=/usr/bin/gcc-4.2

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#use bash_completion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     . $(brew --prefix)/etc/bash_completion
#   fi

PATH=$PATH:~/Data/Scripts:~/Data/Utils/rar:~/_Applications:~/_Applications/lynx

source ~/.git-prompt.sh

# alias to quickly show if any Handbrake processes are running
alias hb='sudo ps -aef | grep HandBrakeCLI'

# alias for quick DNS cache flushing
alias fc='sudo dscacheutil -flushcache'

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# set the prompt to show current working directory and git branch name, if it exists

# this prompt is a green username, black @ symbol, cyan host, magenta current working directory and white git branch (only shows if you're in a git branch)
# unstaged and untracked symbols are shown, too (see above)
# this prompt uses the short colour codes defined above
#PS1='${GREEN}\u${BLACK}@${CYAN}\h:${MAGENTA}\w${WHITE}`__git_ps1 " (%s)"`\$ '

# this is a cyan username, @ symbol and host, magenta current working directory and white git branch
# it uses the shorter , but visibly more complex, codes for text colours (shorter because the colour code definitions aren't needed)
# PS1='\[\033[0;36m\]\u@\h\[\033[01m\]:\[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]\$ '

# return the prompt prefix for the second line
function set_prefix {
    BRANCH=`__git_ps1`
    if [[ -z $BRANCH ]]; then
        echo "${NORMAL}o"
    else
        echo "${UNDERLINE}+"
    fi
}

# and here's one similar to Paul Irish's famous prompt ... not sure if this is the way he does it, but it works  :)
# \033[s = save cursor position
# \033[u = restore cursor position

PS1='${GREEN}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL} '

# PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
