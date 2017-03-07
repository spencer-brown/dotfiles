#!/bin/bash

# Creates symlinks for these configuration files. You will be prompted to confirm the replacement of
# any existing configuration files before they are replaced.

PWD=$(pwd)

ln -si $PWD/.vimrc $HOME/.vimrc
ln -si $PWD/.tmux.conf $HOME/.tmux.conf
ln -si $PWD/.zshrc $HOME/.zshrc
ln -si $PWD/spencer.zsh-theme $HOME/.oh-my-zsh/themes/spencer.zsh-theme
