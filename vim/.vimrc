execute pathogen#infect()

" General
syntax on
set nocompatible
silent! set mouse=nvc

" Lightline
set laststatus=2
set noshowmode

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Colors
set t_Co=256
let g:monokai_termcolors=256
colorscheme monokai

" Featurees
set ignorecase "Ignores case"
set autoindent "Copy indent from last line when starting new line"
set backspace=indent,eol,start
set cursorline "Highlight current line"
set nostartofline "Don't reset cursor to start of line when moving around"
set title "Show title in menu bar"
set nu "Show line numbers"
set autoindent "Copy indent from last line when starting new line."

" Moving screen lines, *not* buffer lines, *ever* "
nmap j gj
nmap k gk
noremap <Up> gk
noremap <Down> gj

" Hide swp files
set dir=/tmp
