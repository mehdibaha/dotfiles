#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

DOTFILES_DIR="${HOME}/.dotfiles"

echo 'Symlinking dotfiles...'
ln -sfv "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/bash/.inputrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vim" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "${DOTFILES_DIR}/macos/sublime.json" ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings
ln -sfv "${DOTFILES_DIR}/macos/spectacle.json" ~/Library/Application\ Support/Spectacle/Shortcuts.json

echo 'Starting boostrap...'
. "$DOTFILES_DIR/macos/bootstrap.sh"

echo 'Starting settings...'
. "$DOTFILES_DIR/macos/settings.sh"

echo ''
echo 'install.sh: Finished!'
echo 'For all changes to be taken into account, please restart your Mac.'
