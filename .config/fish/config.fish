# Set up dotfiles git command
alias config='/usr/bin/git --git-dir=$HOME/.keawade-config/ --work-tree=$HOME'

# Initialize starship prompt
starship init fish | source

# Select node version to use with nvm for session
nvm use 14

# Be more polite
alias f='fuck'

# Override a few coreutils with fancier versions
alias ls='exa'
#alias cat='bat'
alias find='fd'

set -gx THEFUCK_OVERRIDEN_ALIASES 'ls,find'

# Kill all docker containers
alias heckindocker='docker rm -f (docker ps -aq)'

# Kill all running containers and delete all images
alias diedockerdie='heckindocker || true && docker system prune --all --force'

function on_exit --on-event fish_exit
    echo 'so long and thanks for all the fish 🐬'
    sleep 0.5
end

alias clear="clear && echo 'so clean ✨'"

