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
Plugin 'w0rp/ale'
Plugin 'altercation/vim-colors-solarized'

" It seems that a bit of lagginess is introduced in the packages in this block, but I'll leave
" further investigation for another day.
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tonchis/vim-to-github'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" vim-airline seems to slow Vim down significantly.
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

set number
set ruler

set smartindent
set autoindent

" Whitespace
set tabstop=2 shiftwidth=2
set expandtab " Spaces instead of tabs
set smarttab
set backspace=indent,eol,start

" Wrapping
set showbreak=...
set linebreak nolist

" Automatic line break at 100 characters in most filetypes.
fun! SetTextWidth()
  " Don't set text width on markdown or html files.
  if &ft =~ 'markdown\|html'
    " Strangely, if this block is left blank, Vim will use the settings from the `else` case.
    set tw=0
    set colorcolumn=0
  else
    " Set text width.
    set tw=100

    " Highlight column 100 to mark max line length
    set colorcolumn=100
  endif
endfun

autocmd BufRead * call SetTextWidth()

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
set background=dark
colorscheme solarized

" Fast saving and quitting
nmap <leader>w :w<cr> 

"7 lines to the cursor when moving vertically using j/k
set so=7

" A buffer becomes hidden when it is abandoned
set hid

" Don't redraw while executing macros. I've observed extreme lage when disabling this.
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

" Relative line numbering. These settings cause vim to become very slow when scrolling.
"set number " Show current line number
"set relativenumber " Show relative line numbers

" Quicker mappings for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Exclude certain filepaths for ctrlp searching
let g:ctrlp_custom_ignore = {
  \'dir': '\.git$\|build\|node_modules'
  \ }

" Use <ctrl>+j/k/h/l to switch panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" No wrapping
set nowrap

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

" Enable JSDoc syntax highlighting for pangloss's javascript syntax plugin.
let g:javascript_plugin_jsdoc = 1

" Map a shortcut for "redraw!" because some buggy plugin I use messes up the the screen, requiring
" me to redraw.
map <C-i> :redr!<CR>

" Get tern docs easily.
map <leader>d :YcmCompleter GetDoc<CR>

" Jump to definition, even into node_modules.
map <leader>g :YcmCompleter GoTo<CR>

" ALE config
let g:ale_linters = {
\ 'javascript': ['eslint']
\}
