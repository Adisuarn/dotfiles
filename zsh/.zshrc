# ====================== Environment & PATH ======================
typeset -U PATH
export PATH="$HOME/.local/bin:$PATH"

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
[ -s "/Users/emmu/.bun/_bun" ] && source "/Users/emmu/.bun/_bun"

#============ Editors ===========
export EDITOR=cursor
export VISUAL=cursor

# ctrl y accept requires zsh-autosuggestions to be active
# bindkey -M viins '^Y' autosuggest-accept 

# bindkey -M viins '^P' up-line-or-beginning-search
# bindkey -M viins '^N' down-line-or-beginning-search

# ================ Initializers and Sources ==============
eval "$(gdircolors)"

# starship 
eval "$(starship init zsh)"

eval "$(zoxide init zsh)" # zoxide


# ================= ALIAS ===================
# For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias ff="fastfetch"

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

# >>> headroom persistent env >>>
export HEADROOM_PORT="8787"
export HEADROOM_HOST="127.0.0.1"
export HEADROOM_MODE="token"
export HEADROOM_BACKEND="anthropic"
export HEADROOM_TELEMETRY="off"
export ANTHROPIC_BASE_URL="http://127.0.0.1:8787"
export ENABLE_TOOL_SEARCH="true"
export COPILOT_PROVIDER_TYPE="anthropic"
export COPILOT_PROVIDER_BASE_URL="http://127.0.0.1:8787"
export OPENAI_BASE_URL="http://127.0.0.1:8787/v1"
# <<< headroom persistent env <<<
