#!/usr/bin/env bash

# Setting dotfiles dir
DOTFILES_DIR="$HOME/.dotfiles"

echo "Symlinking .bash_profile to $HOME"
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
echo "Symlinking .vimrc to $HOME"
ln -sf "$DOTFILES_DIR/vim/.vimrc" ~
echo "Symlinking .vim to $HOME"
ln -sf "$DOTFILES_DIR/vim/.vim" ~
echo "Symlinking .gitconfig to $HOME"
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
echo "Symlinking .gitignore_global to $HOME"
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~

if [ "$(uname)" == "Darwin" ]; then
    echo "Symlinking spectacle.json to $HOME/Library/Application Support/Spectacle/Shortcuts.json"
    ln -sf "$DOTFILES_DIR/apps/spectacle/spectacle.json" "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
fi
