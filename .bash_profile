# Go
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$PATH
export CDPATH=".:$GOPATH/src/github.com:$CDPATH"
export TERM=xterm-256color
export CLICOLOR=1
export EDITOR=vim
set -o vi
ulimit -n 16384

# Sourcegraph
export SG_PEM_ENCRYPTION_PASSWORD=a
export SG_TICKET_SIGNING_KEY=D88QLbOEnpYeWcUBxmwyaDTN7u2SL+gkZtzzpp4CvszWu/OBDEHUSfuY1coZx46dA3uP1oGByWHBczo0EeENlw==
export SG_SESSION_SIGNING_KEY_BASE64=D88QLbOEnpYeWcUBxmwyaDTN7u2SL+gkZtzzpp4CvszWu/OBDEHUSfuY1coZx46dA3uP1oGByWHBczo0EeENlw==
export SG_PEM_ENCRYPTION_PASSWORD=aaa
export SG_SESSION_ENCRYPTION_KEY_BASE64=d3yTwrqO5jpZXrQSR9U3XOeFi07QJ2/sCkDNoj0Cs08=
export GITHUB_CLIENT_ID=8f375cca22470ba3fc2e
export GITHUB_CLIENT_SECRET=6ee610a458fe492a719c4080fdfbab41a8cf2d80
export SG_SRCLIB_NO_DOCKER=t
alias sw='SG_SRCLIB_NO_DOCKER=t sgx work --build-root $GOPATH/src'
alias cds='cd ~/go/src/sourcegraph.com'

# Postgres
export PGHOST=localhost
export PGDATABASE=sg
export PGUSER=Gabriel
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

##
# HISTORY AUCO-COMPLETE
##

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export NVM_DIR="/Users/gabriel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
