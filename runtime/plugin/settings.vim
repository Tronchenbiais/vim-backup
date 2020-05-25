" Colorscheme
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material
set termguicolors
set background=dark
filetype plugin indent on
syntax on
" Dim inactive buffers
highlight ActiveWin guibg=bg
highligh InactiveWin guibg=#202020
set winhighlight=Normal:ActiveWin,NormalNC:InactiveWin

" Common options
set mouse=a
set number relativenumber
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
set scrolloff=8

" Insert and command mode completion
set wildmode=longest:full,full
set wildmenu
set completeopt=menu,menuone,noinsert,noselect
set pumheight=10
set noinfercase

" Enable concealed text
" These settings work well with neosnippet.
set conceallevel=1
set concealcursor=vi

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
set foldnestmax=2
set foldlevel=0

"==============
" NVIM SPECIFIC
"==============

" Terminal sepcific options
if(has('nvim'))
    augroup terminal_config
        au!
        autocmd TermEnter * setlocal nonumber norelativenumber
        autocmd TermLeave * setlocal number relativenumber
        tmap <C-S> <C-\><C-N>
        tmap <C-Q> <C-\><C-N>
    augroup END
endif

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
