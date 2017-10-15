# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, but it should work on Unix with a bit of tweaking.

## Overview

### Features

* Install brew/casks/macOS apps
* Setup macOS settings (even the Dock apps!)
* Setup settings for macOS apps (Sublime Text, Spectacle)
* Symlinks dotfiles (bash_profile, vim, gitconfig...)
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

## Install

Clone the dotfiles with Git:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles

**Make sure to read through the config files**, then:

* If you want to include installation of apps/recipes (common in new computers):

        INSTALL_APPS=1 source ~/.dotfiles/install.sh

* If you're only making changes to the settings (common for adding :

        source ~/.dotfiles/install.sh

## (Bonus) Backup

To configure a backup, add a remote storage and a local remote using:

    rclone config

To verify rclone is set-up properly, run the following command:

    > rclone listremotes
    gdrive: # can be any other storage solution
    local: # this is your locale hard-drive

Finally, add the following line to your launchd script:

    rclone sync --exclude-from $RCLONE_FILTER local:$HOME $RCLONE_REMOTE:$HOSTNAME

Make sure variables are properly set in [settings.sh](macos/settings.sh), then:

    source ~/.dotfiles/install.sh

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
