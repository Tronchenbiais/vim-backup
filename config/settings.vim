" Colorscheme
set background=dark
filetype plugin indent on
syntax on

" Appearance
if(has('win32'))
    set guifont=Consolas:h11
endif
if(has('gui_running'))
    colorscheme solarized
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
endif

" Common options
set mouse=a
set number
set showcmd
set wildmenu "c-n and c-p in command line
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set belloff=all

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" backup files and undo files
if(has('win32'))
    set nowritebackup
    set backupdir=$TEMP
    set undodir=$TEMP
endif

" fix backspace issues in windows
set bs=2
