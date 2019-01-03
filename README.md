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

        INSTALL_APPS=1 source ~/.dotfiles/start.sh

* If you're only making changes to the settings:

        source ~/.dotfiles/start.sh

### Backup (optional)

1. Add a remote storage and a local remote using `rclone config`, and make sure the scripts are set up properly for using your preferred remote solution
2. Make sure rclone-related variables are properly set in [settings.sh](os/macos_settings.sh)
3. *Bonus*: If you want to test which files/folders will be included in each backup:

        rclone sync --dry-run --filter-from $RCLONE_FILTER local:$HOME gdrive:$HOSTNAME

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
