" Colorscheme
set background=dark
colorscheme gruvbox
filetype plugin indent on
syntax on
" Dim inactive buffers
highlight ActiveWin ctermbg=0
highligh InactiveWin ctermbg=234
set winhighlight=Normal:ActiveWin,NormalNC:InactiveWin

" Common options
set mouse=a
set number
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set encoding=utf-8
set belloff=all
set splitbelow
set splitright
set clipboard=unnamedplus

" Insert and command mode completion
set wildmode=longest:full,full
set wildmenu
set completeopt=menu,menuone,longest,preview
set noinfercase

" Indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Highlighting lines and columns
set cursorline
set colorcolumn=80

" Folding
set foldmethod=indent
set foldnestmax=1
set foldlevel=2

"==================
" WINDOWS SPECIFIC
"==================

" backup files and undo files
if(has('win32'))
    set nowritebackup
    set backupdir=$TEMP
    set undodir=$TEMP
endif

" fix backspace issues in windows
set bs=2
