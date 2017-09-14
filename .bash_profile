# Load the shell dotfiles, and then some:

for file in ~/.dotfiles/.{path,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
