# Load the shell dotfiles with specialized versions for each OS
for file in ~/.dotfiles/bash/.{env,path,bash_prompt,exports,aliases,functions}{,_$(uname)}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
