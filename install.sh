#!/bin/bash

set -euo pipefail

echo "--- Starting dotfiles installation ---"

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
        echo "Complete the GUI prompt if it appears, then rerun the script."
        exit 0
    fi
fi

# Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
   echo "✅ Oh My Zsh already installed"
fi

# Homebrew
## Install
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

brew analytics off
brew update

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew install satococoa/tap/wtp
brew install anomalyco/tap/opencode

## Formulae
echo "Installing Brew Formulae..."

## Core Utils
echo "Install gnu coreutils"
brew install coreutils

### Must Have things
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install atuin
brew install sketchybar
brew install stow
brew install fzf
brew install bat
brew install fd
brew install zoxide
brew install lua
brew install eza
brew install fastfetch
brew install luajit
brew install luarocks
brew install prettier
brew install make
brew install qmk
brew install ripgrep

### Terminal
brew install git
brew install starship
brew install tree-sitter
brew install tree
brew install mactop
brew install borders

### dev things
brew install node
brew install yarn
brew install pnpm
brew install nvm
brew install rust
brew install biome
brew install lazygit
brew install go
brew install bottom
brew install python
brew install git-flow
brew install oven-sh/bun/bun
brew install sqlite

## Casks
echo "Brew Installing --cask..."
brew install --cask raycast
brew install --cask ghostty
brew install --cask gitkraken
brew install --cask goland
brew install --cask rustrover
brew install --cask keka
brew install --cask kekaexternalhelper
brew install --cask alt-tab
brew install --cask spotify
brew install --cask hiddenbar
brew install --cask itsycal
brew install --cask zen-browser
brew install --cask vesktop
brew install --cask visual-studio-code
brew install --cask karabiner-elements
brew install --cask nikitabobko/tap/aerospace
brew install --cask betterdisplay
brew install --cask linearmousbe
brew install --cask font-geist-mono
brew install --cask font-sf-pro
brew install --cask font-geist-mono-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

## MacOS settings
echo "Changing macOS defaults..."
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write InitialKeyRepeat -int 15
killall Dock &>/dev/null || true

csrutil status
echo "Installation complete..."

# Clone dotfiles repository
if [[ ! -d "$HOME/dotfiles" ]]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/Sin-cy/dotfiles.git "$HOME/dotfiles"
else
    echo "✅ Dotfiles already cloned, pulling latest..."
    cd "$HOME/dotfiles" && git pull
fi

# export gnu coreutils to path
echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc 2>/dev/null || true

# Navigate to dotfiles directory
echo "Stowing dotfiles..."
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow -R -t ~ aerospace mactop karabiner starship zsh atuin ghostty

echo "Dotfiles setup complete!"
