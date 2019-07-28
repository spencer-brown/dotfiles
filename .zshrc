# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Update path.
# - Include pip-installed libs.
export PATH=$PATH:$HOME/Library/Python/2.7/bin

# Set name of the theme to load.
ZSH_THEME="spencer"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Delete merged branches.
alias gbclean="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"

# Short for "re-yarn" - reinstall node modules.
alias rey="rm -rf node_modules && yarn"

# "Git-add checked in"
alias gach='ga $(git ls-files -m)'

# "On an ambiguous completion, instead of listing possibilities or beeping, insert the first match
# immediately."
setopt menu_complete

# For System1 config
source ~/.system1

# nvm config brew brew-based installation
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
