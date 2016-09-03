# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for extra stuff you want to try out.

for file in ~/.dotfiles/.{path,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Git completion
[ -f ~/.dotfiles/.git-completion.bash ] && . ~/.dotfiles/.git-completion.bash

# added by Pew
source $(pew shell_config)
