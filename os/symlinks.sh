#!/usr/bin/env bash

echo "Symlinking .bash_profile to $HOME"
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
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

if [ "$OS" == "macos" ]; then
    echo "Symlinking my.sublime-settings to $HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
    ln -sf "$DOTFILES_DIR/os/my.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
    echo "Symlinking my.sublime-keymap to $HOME/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
    ln -sf "$DOTFILES_DIR/os/my.sublime-keymap" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
    echo "Symlinking spectacle.json to $HOME/Library/Application Support/Spectacle/Shortcuts.json"
    ln -sf "$DOTFILES_DIR/os/spectacle.json" "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
fi
