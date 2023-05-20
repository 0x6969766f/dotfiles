#!/usr/bin/env bash

set -e

DOTFILES="${HOME}/Development/dotfiles"

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

# read -p "Did you created an ssh key and added it to all services? press 'Y' or 'y' to continue " -n 1 -r

# if [[ $REPLY =~ ^[Yy]$ ]]; then
#   source ./macos.sh
# fi

# Command Line Tools
info "Installing macOS Command Line Tools"
if [[ ! -x /usr/bin/gcc ]]; then
  xcode-select --install
  xcode-select --switch /Library/Developer/CommandLineTools
  success "Command Line tools installed successfully!"
else
  success "Command Line Tools already installed, skipping..."
fi

printf "\n"

# Rosetta
# Info "Installing Rosetta"
# /usr/bin/pgrep -q oahd && echo 'Rosetta already installed' || /usr/sbin/softwareupdate --install-rosetta --agree-to-license
# success "Rosetta installed successfully!"

# printf "\n"

# Homebrew
info "Installing Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  success "Homebrew installed successfully!"
else
  success "Homebrew already installed, updating..."
  brew update && brew upgrade
fi

printf "\n"

# Ansbible
info "Installing Ansible"
if brew list ansible &>/dev/null; then
  success "Ansible already installed, skipping..."
else
  brew install ansible
  success "Ansible installed successfully!"
fi

printf "\n"


# Dotfiles
Info "Setting up directories..."
mkdir -p $HOME/Archives
mkdir -p $HOME/Development
mkdir -p $HOME/Screenshots
if [[ -d "$DOTFILES" ]]; then
  rm -rf $DOTFILES
fi
mkdir -p $DOTFILES
success "Directories created successfully!"

info "Fetching dotfiles..."
git clone https://github.com/0x6969766f/dotfiles.git $DOTFILES
cd $DOTFILES
git pull origin main
success "Dotfiles fetched successfully!"

printf "\n"

# Playbook
info "Running playbook..."

# Get full directory path of this wrapper
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# Install Ansible requirements like roles and collections
ANSIBLE_CONFIG=${SCRIPTPATH}/ansible.cfg ansible-galaxy install -r ${SCRIPTPATH}/requirements.yml &>/dev/null
# Execute the Ansible playbook
ANSIBLE_CONFIG=${SCRIPTPATH}/ansible.cfg ansible-playbook ${SCRIPTPATH}/config.yml --ask-become-pass --tags "all"

success "Done!"

printf "\n" && exit 0


