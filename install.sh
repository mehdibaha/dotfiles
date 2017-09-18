#!/usr/bin/env bash

export DOTFILES_DIR="~/.dotfiles"

ln -sfv "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/bash/.inputrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vim" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

. "$DOTFILES_DIR/macos/bootstrap.sh"
. "$DOTFILES_DIR/macos/settings.sh"
