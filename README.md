# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

Most of the features are targeted to macOS systems, but the dotfiles are fully compatible with Linux-based systems.

## Overview

* Install brew/casks/macOS apps
* Setup settings for macOS and apps (Dock positions, Sublime Text, Spectacle)
* Symlink dotfiles (bash_profile, vim, gitconfig...)
* Setup periodic script w/ native launchd (for: backups, cleanups, updates...)

### Packages

* [Recipes](https://brew.sh)
    * **basics**: bash, coreutils, git
    * **utilities**: tree, wget, openssl
    * **binaries**: python, heroku, mongodb
    * **extras**: mas, trash, dockutil, hub

* [Casks](https://caskroom.github.io) + [macOS apps](https://github.com/mas-cli/mas)
    * **utilities**: Spectacle, The Unarchiver
    * **extras**:  Skype, VLC
    * **dev stuff**: Docker, Sublime Text
    * **email**: Spark

## Install

Clone the dotfiles with Git:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles

**Make sure to read thoroughly the config files**, then:

* If you want to include installation of apps/recipes (common in new computers):

        INSTALL_APPS=1 source ~/.dotfiles/boot.sh

* If you're only making changes to the settings:

        source ~/.dotfiles/boot.sh

### Backup (optional)

1. Add a remote storage and a local remote using `rclone config`

2. To verify rclone is set-up properly, run the following command:

       > rclone listremotes
       gdrive: # can be any other storage solution
       local: # this is your locale hard-drive

3. Make sure rclone-related variables are properly set in [settings.sh](os/settings.sh).

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
