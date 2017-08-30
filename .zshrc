# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Update path.
# - Include pip-installed libs.
export PATH=$PATH:$HOME/Library/Python/2.7/bin:$HOME/elasticsearch/bin

# Set name of the theme to load.
ZSH_THEME="spencer"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-nvm osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias s="supervisorctl"
alias sr="supervisorctl restart"
alias st="supervisorctl tail -f"
alias ss="supervisorctl shutdown"
alias sd="supervisord"

alias max="cd ~/mixmax/mixmax-runner && supervisord && sudo yarn start"

alias elasticsearch="~/elasticsearch/bin/elasticsearch"

# Delete merged branches.
alias gbclean="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"

# "On an ambiguous completion, instead of listing possibilities or beeping, insert the first match
# immediately."
setopt menu_complete

# added by travis gem
[ -f /Users/spencer/.travis/travis.sh ] && source /Users/spencer/.travis/travis.sh
