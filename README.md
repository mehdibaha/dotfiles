# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

Most of the features are targeted to macOS systems, but the dotfiles are fully compatible with Linux-based systems.

## Overview

* Install brew/casks/macOS apps
* Setup settings for macOS and apps (Dock positions, Rectangle)
* Symlink dotfiles (bash_profile, vim, gitconfig...)

### Packages

* [Recipes](https://brew.sh)
    * **basics**: bash, coreutils, git
    * **utilities**: tree, wget, openssl
    * **binaries**: python, heroku, mongodb
    * **extras**: mas, trash

* [Casks](https://caskroom.github.io) + [macOS apps](https://github.com/mas-cli/mas)
    * **utilities**: Rectangle
    * **dev stuff**: Docker, Visual Studio Code

## Install

Open a terminal, configure it to open with `/bin/bash` then clone this repo:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles

**Make sure to read thoroughly the config files**, then:

* If you want to include installation of apps/recipes (common in new computers):

        INSTALL_APPS=1 source ~/.dotfiles/start.sh

* If you're only making changes to the settings:

        source ~/.dotfiles/start.sh

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
