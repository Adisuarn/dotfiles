# ====================== Environment & PATH ======================
typeset -U PATH
export PATH="$HOME/.local/bin:$PATH"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml" # starship

# ====================== Completions ======================
fpath=(~/completions $fpath)

# ====================== Oh My Zsh ======================
# path on mac : ~/.oh-my-zsh/custom/plugins/
# then run git clone <link in the to plugin repo>
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ====================== Extra Completions ======================
[ -s "/Users/emmu/.bun/_bun" ] && source "/Users/emmu/.bun/_bun"

#============ Editors ===========
export EDITOR=zed
export VISUAL=zed

# ================ Initializers and Sources ==============
eval "$(gdircolors)"

# starship
eval "$(starship init zsh)"

eval "$(zoxide init zsh)" # zoxide

eval "$(pyenv init -)" # python env

# ================= ALIAS ===================
# For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias ff="fastfetch"

# Next level ls (options:  --no-filesize --no-time --no-permissions)
alias ls="eza --no-filesize --long --color=always --icons=always --no-user"