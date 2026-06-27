eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG=en_US.UTF-8

#------------All PATHS------------
# GNU coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Add local ~/scripts to the PATH
export PATH="$HOME/scripts:$PATH"

# Starship PATH
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Path to your oh-my-zsh installation.
# NOTE : Disabled Shell Prompt: Currently using Starship
# NOTE: using oh-my-zsh only for zsh plugins management
export ZSH="$HOME/.oh-my-zsh"

# NVM 
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bun
# bun completions
[ -s "/Users/emmu/.bun/_bun" ] && source "/Users/emmu/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#------------Langs------------

# Golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
