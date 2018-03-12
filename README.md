# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, but it should work on Unix with a bit of tweaking.

## Overview

* Install brew/casks/macOS apps
* Setup macOS settings (even the apps in the Dock!)
* Setup settings for macOS apps (Sublime Text, Spectacle)
* Symlink dotfiles (bash_profile, vim, gitconfig...)
* Setup periodic script w/ native launchd (for: backups, cleanups, updates...)

### Packages

* [Recipes](https://brew.sh)
    * **basics**: bash, coreutils, git, git-extras
    * **utilities**: tree, wget, openssl
    * **binaries**: python, python3, heroku, mongodb
    * **extras**: mas, trash, dockutil, hub

* [Casks](https://caskroom.github.io) + [macOS apps](https://github.com/mas-cli/mas)
    * **utilities**: Spectacle, The Unarchiver
    * **extras**:  Skype, VLC
    * **dev stuff**: Docker, Sublime Text
    * **email + todo**: Spark, Wunderlist

### Backup

1. Add a remote storage and a local remote using `rclone config`

2. To verify rclone is set-up properly, run the following command:

       > rclone listremotes
       gdrive: # can be any other storage solution
       local: # this is your locale hard-drive

3. Make sure rclone-related variables are properly set in [settings.sh](macos/settings.sh).

## Install

Clone the dotfiles with Git:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles

**Make sure to read thoroughly the config files**, then:

* If you want to include installation of apps/recipes (common in new computers):

        INSTALL_APPS=1 source ~/.dotfiles/install.sh

* If you're only making changes to the settings:

        source ~/.dotfiles/install.sh

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
