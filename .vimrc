" Required by Vundle.
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'
Plugin 'wookiehangover/jshint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

set number
set ruler
syntax on
autocmd BufNewFile,BufRead *._js set filetype=javascript

set smartindent
set autoindent

" Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab " Spaces instead of tabs
set smarttab
set backspace=indent,eol,start

" Wrapping
set showbreak=...
set wrap linebreak nolist

" Automatic line break at 100 characters
set tw=100

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status bar
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set showcmd
set wildmenu

" Double percentage sign in command mode is expanded
" to directory of current file - vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Solarized
syntax enable
let g:solarized_termtrans=1
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

" Fast saving and quitting
nmap <leader>w :w<cr> 

"7 lines to the cursor when moving vertically using j/k
set so=7

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
set mat=2

" Turn backup off
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^

" Relative line numbering
set number " Show current line number
set relativenumber " Show relative line numbers

" Quicker mappings for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Only check with JSHint when writing
let JSHintUpdateWriteOnly=1

" Exclude certain filepaths for ctrlp searching
set wildignore+=node_modules/*

" Use <ctrl>+j/k/h/l to switch panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" No wrapping
set nowrap

" Highlight column 100 to mark max line length
set colorcolumn=100

" Map <leader>s to Silver Surfer
nmap <leader>s :Ack!<Space>
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR> " bind K to grep word under cursor

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Ctrl-P/Ack/ag settings
if executable('ag')
  " Set ack.vim to use ag instead of ack because ag is an order of magnitude faster.
  let g:ackprg = 'ag --vimgrep -p "./.gitignore"'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Default syntastic settings. Worth looking into further... "It is
" recommended that you start by adding the following lines to your vimrc file,
" and return to them after reading the manual (see :help syntastic in Vim)"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
