function update -d "update system packages, fish plugins, and completions"
  echo 'Starting update'

  if test -f "/etc/fedora-release"
    echo 'Updating Fedora packages'
    sudo dnf update
  end

  if test (uname) = 'Darwin'
    echo 'Updating Brew packages'
    brew update
    brew upgrade
    brew cleanup
  end

  echo 'Updating Fisher plugins'
  fisher update

  echo 'Updating Fish completions'
  fish_update_completions
end
