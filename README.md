# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, but it should work on Unix with a bit of tweaking.

## Overview

### Features

* Setup nicely configured macOS settins (even the Dock apps!)
* Setup settings for macOS apps (Sublime Text, Spectacle)
* Symlinks dotfiles (bash_profile, vim, gitconfig...)
* Setup periodic script w/ native launchd (cleanups, updates...)
* Installs necessary brew/casks/macOS apps

### Packages

* [Homebrew recipes](https://brew.sh)
    * bash mas coreutils git git-extras tree wget heroku mongodb node
    * openssl python python3 trash youtube-dl dockutil hub fd

* [Homebrew casks](https://caskroom.github.io)
    * spectacle skype vlc docker the-unarchiver sublime-text

* [macOS apps](https://github.com/mas-cli/mas)
    * Spark Wunderlist

## Install

On a sparkling fresh installation of macOS, install the dotfiles with Git:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles
    INSTALL_APPS=1 source ~/.dotfiles/install.sh

For config-only changes (no updating or installing packages):

    source ~/.dotfiles/install.sh

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
