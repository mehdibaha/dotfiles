#!/usr/bin/env bash

###########################
##### Config Variables
###########################
BREW_TAPS=(homebrew/cask-drivers heroku/brew)
BREW_RECIPES=(bash coreutils git git-extras wget mas bat postgresql heroku openssl python trash awscli openjdk@17 postgresql rabbitmq)
BREW_CASKS=(rectangle firefox docker google-drive visual-studio-code tunnelblick itsycal logitech-options sfdx mongodb-compass)
MAC_APPS=()

###########################
##### XCode
###########################
echo '--XCode--'

echo 'Install XCode...'
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

###########################
##### Homebrew
###########################

# Checking if users asks to install apps
if [ -n "$INSTALL_APPS" ]; then

    echo ''
    echo '--Homebrew--'

    echo 'Install Homebrew...'
    if [[ ! "$(type -P brew)" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo 'Update/Upgrade Homebrew...'
    { brew update && brew upgrade; } &> /dev/null

    echo 'Install taps...'
    current_taps=$(brew tap)
    for tap in "${BREW_TAPS[@]}"; do
        if [[ ! "$(echo $current_taps | grep -i $tap)" ]]; then
            echo "    Install $tap..."
            brew tap $tap &> /dev/null
        fi
    done

    echo 'Install recipes...'
    current_recipes=$(brew list)
    for recipe in "${BREW_RECIPES[@]}"; do
        if [[ ! "$(echo $current_recipes | grep -i $recipe)" ]]; then
            echo "    Install $recipe..."
            brew install $recipe &> /dev/null
        fi
    done

    ###########################
    ##### Homebrew Cask
    ###########################
    echo ''
    echo '--Homebrew Cask--'

    echo 'Install cask recipes...'

    for cask in "${BREW_CASKS[@]}"; do
        search=$(cut -d '-' -f 1 <<< "$cask")
        if [[ ! "$(find /Applications -maxdepth 2 | grep -i $search)" ]]; then
            echo "    Install $cask..."
            brew install --cask $cask &> /dev/null
        fi
    done

    echo 'Update/Upgrade/Prune Homebrew...'
    { brew update && brew upgrade && brew cleanup --prune=all; } &> /dev/null

    ###########################
    ##### MacOS Apps
    ###########################
    echo ''
    echo '--MacOS Apps--'

    echo 'Install MacOS Apps...'
    current_apps=$(mas list)
    for app in "${MAC_APPS[@]}"; do
        if [[ ! "$(echo $current_apps | grep -i $app)" ]]; then
            echo "    Install $app..."
            mas install $app &> /dev/null
        fi
    done

    echo 'Upgrade MacOS apps...'
    mas upgrade &> /dev/null
fi
