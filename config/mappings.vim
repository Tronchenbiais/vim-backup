" Leader keys
let mapleader="ù"
let maplocalleader="_"

" Tabbing shortcuts
nmap <C-K> :tabnext<CR>
nmap <Leader>k :tabmove +1<CR>
nmap <C-J> :tabprevious<CR>
nmap <Leader>j :tabmove -1<CR>
nmap <Leader>w :tabclose<CR>

" Windows
nnoremap <C-C> <C-W>c
nnoremap <C-T> :vnew<CR>
nnoremap <Leader><Leader> :cclose\|lclose\|helpclose\|pclose<CR>

" Using the TAB Key
" Switching between windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
" Indenting in visual mode
vnoremap <Tab> >
vnoremap <S-Tab> <

" Spell Checking
nnoremap zs 1z=

" Scrolling
nnoremap <C-D> 8<C-D>
nnoremap <C-U> 8<C-U>

" Auto-closing brackets and quotes
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O

" Navigating errors
nmap <C-n> :cnext<CR>
nmap <C-p> :cprevious<CR>
nmap <Leader>n :lnext<CR>
nmap <Leader>p :lprevious<CR>

" Ctrl-Backspace to delete word
inoremap <C-H> <C-W>

" Jump to tags with AZERTY
nnoremap <Leader>g <C-]>
vnoremap <Leader>g <C-]>
nnoremap <C-H> <C-O>
nnoremap <C-L> <C-I>

" Repeat macro
nnoremap Q @@

