set nocompatible

set t_Co=256
syntax on
let g:monokai_termcolors=256
colorscheme monokai

set autoindent "Copy indent from last line when starting new line"
set backspace=indent,eol,start
set cursorline " Highlight current line "
set nostartofline " Don't reset cursor to start of line when moving around "
set title " Show title inmenu bar "
set mouse=a " Enable line numbers"
set nu " Show line numbers "
imap ii <Esc> " Change swith mode from ESC to double-i"

" Indentation
set autoindent " Copy indent from last line when starting new line.
set shiftwidth=4 " The # of spaces for indenting.
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=4 " Tab key results in 2 spaces
set tabstop=4 " Tabs indent only 2 spaces
set expandtab " Expand tabs to spaces
