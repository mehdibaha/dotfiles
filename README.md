# 🔨 dotfiles

These are my dotfiles. Take anything you want, but at your own risk.

It targets macOS systems, but it should work on Unix with a bit of tweaking.

## Package overview

* Core
  * Bash + [coreutils](https://en.wikipedia.org/wiki/GNU_Core_Utilities) + bash-completion
  * [Homebrew](https://brew.sh) + [homebrew-cask](https://caskroom.github.io)
  * Git + Python 2/3
* macOS apps

## Install

On a sparkling fresh installation of macOS, install the dotfiles with Git:

    git clone https://github.com/mehdibaha/dotfiles.git ~/.dotfiles
    INSTALL_APPS=1 source ~/.dotfiles/install.sh

For config-only changes (no updating or installing packages):

    source ~/.dotfiles/install.sh

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io).
