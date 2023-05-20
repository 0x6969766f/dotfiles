#!/usr/bin/env bash

# PowerLevel10k
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
echo -e "done, restarting zsh...\n"
exec zsh
p10k configure
