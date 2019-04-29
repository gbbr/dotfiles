# Go
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export GODEV=~/g/go
export PATH=/usr/local/bin:/usr/local/opt/ruby@2.3/bin:/usr/local/mysql/bin:/usr/local/go/bin:~/go/src/github.com/golang/go/bin:$GOPATH/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export CDPATH=".:$GOPATH/src/github.com"
export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=vim
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/

set -o vi
## ulimit -n 16384

# Postgres
export PGHOST=localhost
export PGUSER=gbbr
export PGPORT=5432
export PGSSLMODE=disable
export PGTZ=UTC

##
# COMMAND LINE FORMAT
##

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
 
PS1="$GREEN\u@\h$NO_COLOUR:\W$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

##
# MY ALIASES
##

alias bye='exit'
alias swap='echo; echo "Breakdown:"; du -hs /private/var/vm/*; echo; echo "Total: "; du -hs /private/var/vm/;echo;'
alias gg="git grep -C 3 $@"
alias cdg="cd ~/go/src/gopkg.in/DataDog/dd-trace-go.v1"
alias cdd="cd ~/go/src/github.com/DataDog"

##
# HISTORY AUCO-COMPLETE
##

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export NVM_DIR="/Users/gabriel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
