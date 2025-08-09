" Required by Vundle.
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jparise/vim-graphql'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'tonchis/vim-to-github'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'alvan/vim-closetag'
Plugin 'hashivim/vim-terraform'
Plugin 'pantharshit00/vim-prisma'

" ALE config
let g:ale_linters = {
\ 'graphql': ['prettier'],
\ 'javascript': ['prettier'],
\ 'typescript': ['tsserver', 'eslint'],
\ 'typescript.tsx': ['tsserver', 'eslint'],
\ 'prisma': ['prettier'],
\}

let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescript.tsx': ['prettier'],
\ 'prisma': ['prettier'],
\}

function! FindProjectRoot(buffer) abort
  " Look for tsconfig.app.json first (specific to Vite client packages)
  let l:tsconfig_app = ale#path#FindNearestFile(a:buffer, 'tsconfig.app.json')
  if !empty(l:tsconfig_app)
    return fnamemodify(l:tsconfig_app, ':h')
  endif

  " Fallback to package.json (general monorepo package boundary)
  let l:package_json = ale#path#FindNearestFile(a:buffer, 'package.json')
  if !empty(l:package_json)
    return fnamemodify(l:package_json, ':h')
  endif

  " Fallback to monorepo root if nothing else is found
  return '/Users/spencerbrown/chestnut' " Adjust to your monorepo root
endfunction

" Tell ALE to use this function to find the project root
let g:ale_root = {
\ 'typescript': function('FindProjectRoot'),
\ 'typescript.tsx': function('FindProjectRoot'),
\}

let g:ale_typescript_tsserver_executable = 'node_modules/.bin/tsserver'
let g:ale_typescript_tsserver_use_global = 0

let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1

let g:ale_fix_on_save = 1

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>D :ALEGoToTypeDefinition<CR>

let g:ale_typescript_tsserver_stderr = 'file'
let g:ale_typescript_tsserver_trace_level = 'verbose'

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

" Automatic line break at 80 characters in most filetypes.
fun! SetTextWidth()
  " Don't set text width on markdown or html files.
  if &ft =~ 'markdown\|html'
    " Strangely, if this block is left blank, Vim will use the settings from the `else` case.
    set tw=0
    set colorcolumn=0
  else
    " Set text width.
    set tw=80

    " Highlight column 80 to mark max line length
    set colorcolumn=80
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
set background=light
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

" Jump to definition, even into node_modules.
map <leader>g :YcmCompleter GoTo<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = 'python3'
let g:ycm_server_python_interpreter = '/opt/homebrew/bin/python3'

autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.prisma set filetype=prisma

" closetag config
let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.html,*.js,*.jsx,*.tsx'
let g:closetag_regions = {
  \ 'javascript.jsx': 'jsxRegion',
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ }

let g:terraform_align=1
let g:terraform_fmt_on_save=1

au BufRead,BufNewFile Dockerfile* set filetype=dockerfile

:set completeopt=menu,preview
