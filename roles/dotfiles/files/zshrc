export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

autoload -U colors && colors

export ZPLUG_HOME="$HOMEBREW_PREFIX/opt/zplug"
source $ZPLUG_HOME/init.zsh

# Yellow (temp) autosuggested string
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# Load plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    zplug install
fi

# Load all modules
zplug load

# Homebrew shell setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Fnm node manager
eval "$(fnm env --use-on-cd)"

# GO
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Nvim
alias vi="nvim"
alias vim="nvim"

# Be nice
alias please="sudo "

# Easier navigation: .., ..., ....
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Launch starship
eval "$(starship init zsh)"
