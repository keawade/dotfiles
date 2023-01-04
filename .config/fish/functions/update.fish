function update -d "update brew, fish plugins, and completions"
  echo 'Starting update'

  if test (uname) = 'Darwin'
    echo 'Updating Brew software'
    brew update
    brew upgrade
    brew cleanup
  end

  echo 'Updating Fisher plugins'
  fisher update

  echo 'Updating Fish completions'
  fish_update_completions
end
