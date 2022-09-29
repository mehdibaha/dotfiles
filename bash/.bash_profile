# Load the shell dotfiles with specialized versions for each OS
for file in ~/.dotfiles/bash/.{env,path,bash_prompt,exports,aliases,functions}{,_$(uname)}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

