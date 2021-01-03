alias config='/usr/bin/git --git-dir=$HOME/.keawade-config/ --work-tree=$HOME'

set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

starship init fish | source

alias f='fuck'
alias ls='exa'

set -x THEFUCK_OVERRIDEN_ALIASES 'ls'

