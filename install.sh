#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

DOTFILES_DIR="$HOME/.dotfiles"

echo '--SYMLINKS--'
. "$DOTFILES_DIR/macos/symlinks.sh"
echo ''

echo '--BOOTSTRAP--'
. "$DOTFILES_DIR/macos/bootstrap.sh"
echo ''

echo '--SETTINGS--'
. "$DOTFILES_DIR/macos/settings.sh"
echo ''

echo '------------'
echo 'Finished!'
echo 'For all changes to be taken into account, please restart your Mac.'
