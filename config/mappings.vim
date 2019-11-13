" Leader keys
let mapleader="ù"
let maplocalleader="_"

" Tabbing shortcuts
nmap <C-T> :tabnew<CR>
nmap <C-K> :tabnext<CR>
nmap <C-L> :tabmove +1<CR>
nmap <C-J> :tabprevious<CR>
nmap <C-H> :tabmove -1<CR>
nmap <C-X> :tabclose<CR>

" Switching between windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Spell Checking
nnoremap zs 1z=

" Auto-closing brackets and quotes
"iabbrev (( (<CR><ESC>a)<ESC>O
"iabbrev )) (<ESC>a)<ESC>i
"iabbrev [[ [<CR><ESC>a]<ESC>O
"iabbrev ]] [<ESC>a]<ESC>i
"iabbrev {{ {<CR><ESC>a}<ESC>O
"iabbrev }} {<ESC>a}<ESC>i
"iabbrev "" "<ESC>a"<ESC>i

" Insert mode movements
inoremap <C-A> <ESC>I
inoremap <C-E> <ESC>A
" Ctrl-Backspace to delete word
inoremap <C-BS> <C-W>

" Jump to tags with AZERTY
nnoremap gt <C-]>
vnoremap gt <C-]>
nnoremap gh "syiw:lh <C-R>s<CR>
vnoremap gh "sy:lh <C-R>s<CR>

" Repeat macro
nnoremap Q @@
