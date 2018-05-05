# Load the shell dotfiles with specialized versions for each OS
for file in ~/.dotfiles/bash/.{path,bash_prompt,exports,aliases,functions}{,_$OS}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

