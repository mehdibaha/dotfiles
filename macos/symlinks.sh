#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"

echo 'Symlinking dotfiles...'
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/bash/.inputrc" ~
ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
ln -sf "$DOTFILES_DIR/vim/.vim" ~
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/macos/my.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -sf "$DOTFILES_DIR/macos/my.sublime-keymap" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
ln -sf "$DOTFILES_DIR/macos/spectacle.json" "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
