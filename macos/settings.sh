#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2> /dev/null &

###########################
##### Config Variables
###########################
COMPUTER_NAME="Mehdi's Air"
HOSTNAME="Mehdis-Air"
SCREENSHOT_FORMAT="png"
SCREENSHOT_PATH="${HOME}/Documents/screenshots"
TIMEZONE="Europe/Paris"
DEFAULT_VIEW="Nlsv" # List View
ICON_SIZE=50
ICON_SPACING=100
STANDBY_DELAY=10800 # 3*60*60
HIBERNATE_MODE=3
ICON_DOCK_SIZE=46

###########################
##### Crontabs
###########################
echo '--'
echo '--Crontabs--'

mailto='MAILTO=""'
brew_update='@daily { brew update && brew upgrade && mas upgrade; } &> /dev/null'
brew_clean='@daily { brew cleanup && brew cask cleanup; } &> /dev/null'
sys_clean='@daily { cd && empty && cleanup; } &> /dev/null'
cron_entries=("$mailto" "$brew_update" "$brew_clean" "$sys_clean")

echo 'Add cron entries...'
for cron_entry in "${cron_entries[@]}"; do
    echo "Add '$cron_entry' to crontab..."
    if ! sudo crontab -l | fgrep "$cron_entry" > /dev/null; then
      (sudo crontab -l 2> /dev/null; echo "$cron_entry") | sudo crontab -
    fi
done

###########################
##### General UI/UX
###########################
echo ''
echo '--General UI/UX--'

echo "Set computer name to $COMPUTER_NAME..."
sudo scutil --set ComputerName $COMPUTER_NAME
echo "Set host name to $HOSTNAME..."
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME

echo 'Set standby delay to 3 hours...'
sudo pmset -a standbydelay $STANDBY_DELAY

echo 'Disable the sound effects on boot...'
sudo nvram SystemAudioVolume=" "

echo 'Disable transparency in the menu bar and elsewhere on Yosemite...'
defaults write com.apple.universalaccess reduceTransparency -bool false

echo 'Disable the “Are you sure you want to open this application?” dialog'
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo 'Save to disk (not to iCloud) by default...'
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo 'Expand save panel by default...'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo 'Expand print panel by default...'
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo 'Remove duplicates in the “Open With” menu...'
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo 'Disable Resume system-wide...'
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

echo 'Enable automatic termination of inactive apps...'
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool false

###########################
##### SSD-specific tweaks
###########################
echo ''
echo '--SSD-specific tweaks--'

# Faster sleeps, faster wakes, but less battery life
# For more info: https://superuser.com/a/62677
echo 'Set hibernate mode to 3...'
sudo pmset -a hibernatemode $HIBERNATE_MODE

echo 'Remove the sleep image file to save disk space...'
sudo /bin/rm -rf /private/var/vm/sleepimage
echo '  Create a zero-byte file instead...'
sudo touch /private/var/vm/sleepimage
echo '  Making sure it can’t be rewritten...'
sudo chflags uchg /private/var/vm/sleepimage

echo 'Disable the sudden motion sensor...'
sudo pmset -a sms 0 # Not useful for SSDs

###################################################################
##### Trackpad, mouse, keyboard, Bluetooth accessories, and input
###################################################################
echo ''
echo '--Trackpad, mouse, keyboard, Bluetooth accessories, and input--'

echo 'Enable tap to click for this user and for the login screen...'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo 'Disable press-and-hold for keys in favor of key repeat...'
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo 'Set a blazingly fast keyboard repeat rate...'
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "fr"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone $TIMEZONE > /dev/null

echo 'Stop iTunes from responding to the keyboard media keys...'
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

###########################
# Screen
###########################
echo ''
echo '--Finder--'

echo 'Save screenshots in PNG format...'
defaults write com.apple.screencapture type -string $SCREENSHOT_FORMAT

echo 'Disable shadow in screenshots...'
defaults write com.apple.screencapture disable-shadow -bool true

echo 'Change default screenshots folder...'
defaults write com.apple.screencapture location -string $SCREENSHOT_PATH

###########################
# Finder
###########################
echo ''
echo '--Finder--'

echo 'Allow quitting via ⌘ + Q; doing so will also hide desktop icons...'
defaults write com.apple.finder QuitMenuItem -bool false

echo 'Disable window animations and Get Info animations...'
defaults write com.apple.finder DisableAllAnimations -bool true

echo 'Show icons for hard drives, servers, and removable media on the desktop...'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo 'Show all filename extensions...'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo 'Show status bar...'
defaults write com.apple.finder ShowStatusBar -bool false

echo 'Show path bar...'
defaults write com.apple.finder ShowPathbar -bool true

echo 'Enable full POSIX path as Finder window title...'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo 'Disable the warning when changing a file extension...'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo 'Enable spring loading for directories...'
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

echo 'Remove the spring loading delay for directories...'
defaults write NSGlobalDomain com.apple.springing.delay -float 0

echo 'Keep folders on top when sorting by name...'
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo 'When performing a search, search the current folder by default...'
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo 'Avoiding create .DS_Store files on network volumes...'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo 'Disable disk image verification...'
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo 'Automatically open a new Finder window when a volume is mounted...'
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo 'Use list view in all Finder windows by default...'
defaults write com.apple.finder FXPreferredViewStyle -string $DEFAULT_VIEW

echo 'Show item info near icons on the desktop and in other icon views...'
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

echo 'Show item info to the right of the icons on the desktop...'
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

echo 'Enable snap-to-grid for icons on the desktop and in other icon views...'
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo 'Increase grid spacing for icons on the desktop and in other icon views...'
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing ${ICON_SPACING}" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing ${ICON_SPACING}" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing ${ICON_SPACING}" ~/Library/Preferences/com.apple.finder.plist

echo 'Increase the size of icons on the desktop and in other icon views...'
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize ${ICON_SIZE}" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize ${ICON_SIZE}" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize ${ICON_SIZE}" ~/Library/Preferences/com.apple.finder.plist

echo 'Show the ~/Library folder...'
chflags nohidden ~/Library

echo 'Show the /Volumes folder...'
sudo chflags nohidden /Volumes

echo 'Expand General, Open with, Sharing & Permissions...'
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

####################################
# Dock, Dashboard, and hot corners
####################################
echo ''
echo '--Dock, Dashboard, and hot corners--'

echo 'Minimize windows into their applications icon...'
defaults write com.apple.dock minimize-to-application -bool true

echo 'Set the icon size of Dock items to 36 pixels...'
defaults write com.apple.dock tilesize -int $ICON_DOCK_SIZE

echo 'Enable spring loading for all Dock items...'
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo 'Show indicator lights for open applications in the Dock...'
defaults write com.apple.dock show-process-indicators -bool true

echo 'Speed up Mission Control animations...'
defaults write com.apple.dock expose-animation-duration -float 0

echo 'Dont group windows by application in Mission Control...'
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool true

echo 'Disable Dashboard...'
defaults write com.apple.dashboard mcx-disabled -bool true

echo 'Dont show Dashboard as a Space...'
defaults write com.apple.dock dashboard-in-overlay -bool true

echo 'Dont automatically rearrange Spaces based on most recent use...'
defaults write com.apple.dock mru-spaces -bool false

echo 'Make Dock icons of hidden applications translucent...'
defaults write com.apple.dock showhidden -bool true

###########################
# Spotlight
###########################
echo ''
echo '--Spotlight--'

echo 'Disable Spotlight indexing for never undexed volumes...'
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

###########################
# Activity Monitor
###########################
echo ''
echo '--Activity Monitor--'

echo 'Show the main window when launching Activity Monitor...'
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

echo 'Show My Processes in Activity Monitor...'
defaults write com.apple.ActivityMonitor ShowCategory -int 102

echo 'Sort Activity Monitor results by CPU usage...'
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###########################
# Terminal
###########################
echo ''
echo '--Terminal--'

echo 'Set UTF-8 in Terminal.app...'
defaults write com.apple.terminal StringEncodings -array 4

###########################
# Sublime Text
###########################
echo ''
echo '--Sublime Text--'

echo 'Install Sublime Text settings...'
cp "${DOTFILES_DIR}/macos/sublime.json" ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

###########################
# Spectacle.app
###########################
echo ''
echo '--Spectacle--'

echo 'Set up my preferred keyboard shortcuts...'
cp "${DOTFILES_DIR}/macos/spectacle.json" ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

###########################
# Time Machine
###########################
echo ''
echo '--Time Machine--'
echo 'Disable local Time Machine backups...'
hash tmutil &> /dev/null && sudo tmutil disablelocal

#################################
# Killing affected applications
#################################
echo ''
echo '--Kill affected applications--'

for app in "Activity Monitor" "Dock" "Finder" "Spectacle"; do
    echo "Kill ${app}"
    killall "${app}" &> /dev/null
done

# Always cool to have those again
for app in "Spectacle"; do
    echo "Open ${app}"
    open "/Applications/${app}.app" &> /dev/null
done

###########################
# The end.
###########################
echo ''
echo 'bootstrap.sh: Done!'

