set nocompatible

set t_Co=256
syntax on
let g:monokai_termcolors=256
colorscheme monokai

set autoindent "Copy indent from last line when starting new line"
set backspace=indent,eol,start
set cursorline " Highlight current line "
set esckeys " Allow cursor keys in insert mode "
set nostartofline " Don't reset cursor to start of line when moving around "
set nu " Enable line numbers "
imap ii <Esc>
