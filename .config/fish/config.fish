# Set up dotfiles git command
alias config='/usr/bin/git --git-dir=$HOME/.keawade-config/ --work-tree=$HOME'

# Make the GNU utils override the default core utils provided by Mac OS
set -gxp fish_user_paths /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gxp MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Initialize starship prompt
starship init fish | source

# Be more polite
alias f='fuck'

# Override a few coreutils with fancier versions
alias ls='exa'
#alias cat='bat'
alias find='fd'
set -x THEFUCK_OVERRIDEN_ALIASES 'ls'

# Kill all docker containers
alias heckindocker='docker rm -f (docker ps -aq)'

# Kill all running containers and delete all images
alias diedockerdie='heckindocker || true && docker system prune --all --force'

# Prompt for merged branches to prune, and then delete them from local
alias gitprune='git branch --merged | grep -v "master\|develop\|*" > /tmp/branches-to-prune && vim /tmp/branches-to-prune && xargs git branch -d < /tmp/branches-to-prune'

function on_exit --on-event fish_exit
    echo 'so long and thanks for all the fish 🐬'
    sleep 0.5
end
