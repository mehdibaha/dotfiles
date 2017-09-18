#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

###########################
##### Config Variables
###########################
BREW_KEGS=(caskroom/cask heroku/brew)
BREW_RECIPES=(bash mas coreutils git git-extras tree wget heroku/brew/heroku mongodb node openssl python python3 trash youtube-dl wifi-password)
BREW_CASKS=(google-chrome spectacle skype vlc docker the-unarchiver sublime-text)
MAC_APPS=(1176895641 410628904) # (Spark, Wunderlist)

###########################
##### XCode
###########################
echo '--'
echo '--XCode--'

echo 'Install XCode...'
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

###########################
##### Homebrew
###########################
echo ''
echo '--Homebrew--'

echo 'Install Homebrew...'
if [[ ! "$(type -P brew)" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Update/Upgrade Homebrew...'
{ brew update && brew upgrade; } &> /dev/null

echo 'Install kegs'
for keg in "${BREW_KEGS[@]}"; do
    echo "    Tap $keg..."
    brew tap $keg &> /dev/null
done

echo 'Install recipes...'
for recipe in "${BREW_RECIPES[@]}"; do
    echo "    Install $recipe..."
    if [[ ! "$(brew list | grep -i $recipe)" ]]; then
        echo "    Install $recipe..."
        brew install $recipe &> /dev/null
    fi
done

echo 'Update/Upgrade/Doctor/Prune Homebrew...'
{ brew update && brew upgrade && brew prune; } &> /dev/null

###########################
##### Homebrew Cask
###########################
echo ''
echo '--Homebrew Cask--'

echo 'Install cask recipes...'
brew cask info this-is-somewhat-annoying 2> /dev/null

for cask in "${BREW_CASKS[@]}"; do
    # sublime-text -> sublime (for easier search in /Applications folder)
    search=$(cut -d '-' -f 1 <<< "$cask")
    if [[ ! "$(find /Applications -maxdepth 2 | grep -i $search)" ]]; then
        echo "    Install $cask..."
        brew cask install $cask &> /dev/null
    fi
done

echo 'Cleanup/Doctor Homebrew Cask...'
{ brew cask cleanup; } &> /dev/null

return 1;

###########################
##### MacOS Apps
###########################
echo ''
echo '--MacOS Apps--'

echo 'Install MacOS Apps'
for app in "${MAC_APPS[@]}"; do
    echo "    Install $app"
    if [[ ! "$(mas list | grep -i $search)" ]]; then
        echo "    Install $app..."
        mas install $app &> /dev/null
    fi
done

echo 'Upgrade MacOS apps'
mas upgrade &> /dev/null

###########################
# The end.
###########################
echo ''
echo 'bootstrap.sh: Done!'
