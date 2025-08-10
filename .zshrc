# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
plugins=(git macos zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Delete merged branches.
alias gbclean="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"

# Add a build-triggering commit.
alias gctb='git commit --allow-empty -m "Trigger Build"'

# Short for "re-yarn" - reinstall node modules.
alias rey="rm -rf node_modules && yarn"
alias ren="rm -rf node_modules && npm i"

alias ns="npm start"

# "Git-add checked in"
alias gach='ga $(git ls-files -m)'

# "On an ambiguous completion, instead of listing possibilities or beeping, insert the first match
# immediately."
setopt menu_complete

# nvm config brew brew-based installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Windsurf
export PATH="/Users/spencerbrown/.codeium/windsurf/bin:$PATH"

alias dpr="open 'https://github.com/chestnutmortgage/chestnut/compare/production...main?expand=1&title=Deploy%20to%20production'"
