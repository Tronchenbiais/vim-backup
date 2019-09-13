" Colorscheme
set background=dark
if has("gui_running")
    colorscheme solarized
endif
filetype plugin indent on
syntax on

" Appearance
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r

" Common options
set mouse=a
set number
set showcmd
set wildmenu "c-n and c-p in command line
set incsearch
set ignorecase
set smartcase

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
