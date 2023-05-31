#!/bin/bash

# This script bootstraps a machine with fish where the more fully featured fish
# init script can take over with nicer syntax.

if test -f "/etc/fedora-release";
then
  sudo dnf install fish
fi

if test (uname) eq "Darwin";
then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install fish
fi

if ! command -v fish &> /dev/null
then
  echo Command fish not found!
  exit 1
fi

fish ~/.config/keawade/init.fish

