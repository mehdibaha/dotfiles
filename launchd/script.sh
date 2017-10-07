#!/usr/bin/env bash

# APP UPDATES
{ /usr/local/bin/brew update && /usr/local/bin/brew upgrade && /usr/local/bin/mas upgrade; } &> /dev/null
echo [$(date +%x\ %X)] "app updates completed"

# APP CLEANUPS
{ /usr/local/bin/brew cleanup  && /usr/local/bin/brew cask cleanup; } &> /dev/null
echo [$(date +%x\ %X)] "app cleanups completed"

# GENERAL CLEANUPS
{ /bin/rm -rfv /Volumes/*/.Trashes && /bin/rm -rfv ~/.Trash && /bin/rm -rfv /private/var/log/asl/*.asl; } &> /dev/null
{ /usr/bin/sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'; } &> /dev/null
{ find /Users/mehdib -type f -name '*.DS_Store' -ls -delete; } &> /dev/null
{ /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder; } &> /dev/null
echo [$(date +%x\ %X)] "general cleanups completed"

# OLD SCREENSHOTS REMOVED
{ find /Users/mehdib/Documents/screenshots/* -type f -mtime +3 -exec rm {} \;; } &> /dev/null
echo [$(date +%x\ %X)] "screenshots removed"
