# ====================== Environment & PATH ======================
typeset -U PATH
export PATH="/Users/personal/.local/bin:$PATH"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml" # starship

# ====================== Completions ======================
fpath=(~/.zsh/completions $fpath)

# ====================== Oh My Zsh ======================
# path on mac : ~/.oh-my-zsh/custom/plugins/
# then run git clone <link in the to plugin repo>
plugins=(
    git 
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# bindkey -r '^['

# ====================== Extra Completions ======================
[ -s "/Users/personal/.bun/_bun" ] && source "/Users/personal/.bun/_bun"

#============ Editors ===========
export EDITOR=vscode
export VISUAL=vscode

# ctrl y accept requires zsh-autosuggestions to be active
# bindkey -M viins '^Y' autosuggest-accept 

# bindkey -M viins '^P' up-line-or-beginning-search
# bindkey -M viins '^N' down-line-or-beginning-search

# ================ Initializers and Sources ==============
eval "$(gdircolors)"

# starship 
eval "$(starship init zsh)"

eval "$(zoxide init zsh)" # zoxide

# Atuin configs
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' atuin-search-viins


# ================= ALIAS ===================
# For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias ff="fastfetch"

# opens documentation through fzf (eg: git,zsh etc.)
alias fman="compgen -c | fzf | xargs man"

# Next level ls (options:  --no-filesize --no-time --no-permissions)
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 

# tree
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "

# lstr
alias lstr="lstr --icons"

# git aliases
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit -m'
alias glog='git log --oneline --graph --all'
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'

alias nvim-scratch="NVIM_APPNAME=nvim-scratch nvim"
alias nvimn="NVIM_APPNAME=nvim-nightly $HOME/.local/nvim-nightly/bin/nvim"
alias nvimmin="NVIM_APPNAME=nvim-min nvim"
alias nvimpack="NVIM_APPNAME=nvim-pack nvim"

# lazygit
alias lg="lazygit"
