if status is-interactive
  # Set up dotfiles git command
  alias config='/usr/bin/git --git-dir=$HOME/.keawade-config/ --work-tree=$HOME'

  # Initialize starship prompt
  starship init fish | source

  # Initialize k8s completions
  kubectl completion fish | source

  # Select node version to use with nvm for session
  nvm use 18 > /dev/null

  # Be more polite
  alias f='fuck'

  # Override a few coreutils with fancier versions
  alias ls='exa'
  #alias cat='bat'
  alias find='fd'

  set -gx THEFUCK_OVERRIDEN_ALIASES 'ls,find'

  alias kc="kubectl"
  alias watchpods="watch -n 1 kubectl get pods"
  alias decapitate="helm ls --all --short | xargs -L1 helm delete"

  alias kc="kubectl"

  alias zola="flatpak run org.getzola.zola"

  function on_exit --on-event fish_exit
    echo 'so long and thanks for all the fish 🐬'
    sleep 0.5
  end

  alias clear="clear && echo 'so clean ✨'"
end

