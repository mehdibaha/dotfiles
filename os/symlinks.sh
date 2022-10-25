#!/usr/bin/env bash

# Setting dotfiles dir
DOTFILES_DIR="$HOME/.dotfiles"

echo "Symlinking files..."
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
ln -sf "$DOTFILES_DIR/vim/.vim" ~
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/.hushlogin" ~
ln -sf "$DOTFILES_DIR/.editorconfig" ~
