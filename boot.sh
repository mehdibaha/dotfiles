#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

# Setting dotfiles dir
DOTFILES_DIR="$HOME/.dotfiles"

# Starting dotfiles
echo "||--Symlinks--||"
. "$DOTFILES_DIR/os/symlinks.sh"
echo ""

if [ "$(uname)" == "Darwin" ]; then
    echo "||--Install apps--||"
    . "$DOTFILES_DIR/os/install_apps.sh"
    echo ""

    echo "||--Settings--||"
    . "$DOTFILES_DIR/os/settings.sh"
    echo ""
fi

echo "Finished!"
echo "For all changes to be taken into account, please reboot your computer."
