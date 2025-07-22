#!/bin/bash

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
    fi
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

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
brew install borders

### dev things
brew install node
brew install yarn
brew install pnpm
brew install nvm
brew install rust
brew install go
brew install python
brew install git-flow
brew install oven-sh/bun/bun
brew install sqlite

## Casks
brew install --cask raycast
brew install --cask ghostty
brew install --cask appcleaner
brew install --cask gitkraken
brew install --cask goland
brew install --cask intellij-idea
brew install --cask rustrover
brew install --cask keka
brew install --cask kekaexternalhelper
brew install --cask alt-tab
brew install --cask hiddenbar
brew install --cask itsycal
brew install --cask zen-browser
brew install --cask vesktop
brew install --cask zed@preview
brew install --cask karabiner-elements
brew install --cask nikitabobko/tap/aerospace
brew install --cask betterdisplay
brew install --cask linearmouse
brew install --cask "font-geist-mono"
brew install --cask "font-geist-mono-nerd-font"
brew install --cask font-jetbrains-mono-nerd-font

## MacOS settings
echo "Changing macOS defaults..."
defaults write com.apple.Dock autohide -bool TRUE
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write InitialKeyRepeat -int 15

csrutil status
echo "Installation complete..."

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/Adisuarn/dotfiles.git $HOME/dotfiles
fi

# export gnu coreutils to path
echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc

# Navigate to dotfiles directory
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow -t ~ aerospace karabiner starship zsh atuin sketchybar ghostty

echo "Dotfiles setup complete!"