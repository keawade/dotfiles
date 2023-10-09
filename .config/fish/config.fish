if status is-interactive
    # Set up dotfiles git command
    alias config='/usr/bin/git --git-dir=$HOME/.keawade-config/ --work-tree=$HOME'

    # Initialize starship prompt
    starship init fish | source

    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    # Initialize k8s completions
    kubectl completion fish | source

    # Select node version to use with nvm for session
    nvm use 18 >/dev/null

    # Override a few coreutils with fancier versions
    alias ls='exa'
    alias vim='nvim'
    alias ts='tmux-sessionizer'

    alias kc="kubectl"
    alias watchpods="watch -n 1 kubectl get pods"
    alias decapitate="helm ls --all --short | xargs -L1 helm delete"
    alias rdrestart="rdctl shutdown && rdctl start"

    function on_exit --on-event fish_exit
        echo 'so long and thanks for all the fish 🐬'
        sleep 0.5
    end

    alias clear="clear && echo 'so clean ✨'"

    alias :q="exit"
end
