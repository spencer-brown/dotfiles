# dotfiles

A collection of my configuration files.

## Prerequisites

* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [nvm](https://github.com/creationix/nvm) ([recommended: zsh-nvm](https://github.com/lukechilds/zsh-nvm))
* vim (`brew install vim`)
* [Vundle](https://github.com/VundleVim/Vundle.vim)

## Setup

* `./install.sh` (creates symlinks mapping to the files in this directory)
* [in vim] `:PluginInstall`
* Follow the installation instructions for [`YouCompleteMe`](https://github.com/Valloric/YouCompleteMe)
* Install Node dependencies in `vim-prettier`'s bundle directory [per its instructions](https://github.com/prettier/vim-prettier#install)

## YouCompleteMe

YCM takes some funky setup sometimes. Not totally sure what the right from-scratch path is, but I recently got YCM to work after doing this:

* Install `macvim` via brew; `link` it via brew.
* Install & link Python via brew (in conjunction with `pyenv`).
* Use the brew-install Python at `/usr/local/bin/python3` to run YCM's `install.py`.
* Configure YCM to use Brew's Python via `let g:ycm_server_python_interpreter = '/usr/local/bin/python3'` in `.vimrc`.
