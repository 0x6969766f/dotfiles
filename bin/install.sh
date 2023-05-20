#!/usr/bin/env bash

set -e

DOTFILES=$HOME/Development/dotfiles

info () {
  printf "\r[ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}

info "Ask for sudo password"
sudo -v

clear

# Move to ~ if we are not there yet
cd

printf "Hello $(whoami)! Let's get you set up.\n\n"

# TODO: Should prompt pre-installation questions here!

# Command Line Tools
info "Installing macOS Command Line Tools"
if [[ ! -x /usr/bin/gcc ]]; then
  xcode-select --install
  success "Command Line tools installed successfully!"
else
  success "Command Line Tools already installed, skipping..."
fi

printf "\n"

# Homebrew
info "Installing Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  success "Homebrew installed successfully!"
else
  success "Homebrew already installed, updating..." && brew update
fi

printf "\n"

# Ansbible
info "Installing Ansible"
if brew list ansible &> /dev/null; then
  success "Ansible already installed! skipping..."
else
  brew install ansible && success "Ansible installed successfully!"
fi

printf "\n"

# Dotfiles
info "Fetching dotfiles..."
if [[ -d $DOTFILES ]]; then
  rm -rf $DOTFILES
fi

mkdir -p $DOTFILES
git clone https://github.com/0x6969766f/dotfiles.git $DOTFILES
cd $DOTFILES

printf $(pwd)
printf $DOTFILES

git pull origin main

# Playbook
info "Running playbook..."
#ANSIBLE_CONFIG=./ansible/ansible.cfg ansible-playbook -i ansible/hosts ansible/dotfiles.yml -v

success "Done!"
exit 0


