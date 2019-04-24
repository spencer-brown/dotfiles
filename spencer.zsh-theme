# Grab the current date (%W) and time (%t):
SPENCER_TIME_="%{$fg[white]%}%{$fg[yellow]%}%t%{$reset_color%}"

# Grab the current username 
SPENCER_CURRENT_USER_=" %{$fg[blue]%}[%n]%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
SPENCER_LOCA_=" %{$fg[cyan]%}:%~\$(git_prompt_info)%{$reset_color%}"

# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}♯"

# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Add mark if branch is dirty.
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"

# Put it all together!
PROMPT="╭$SPENCER_TIME_$SPENCER_CURRENT_USER_$SPENCER_LOCA_
╰ %B$%b "
