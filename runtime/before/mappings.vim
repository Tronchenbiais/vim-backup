" Leader keys
let mapleader="ù"
let maplocalleader="_"

" Tabbing shortcuts
nmap <C-j> :tabnext<CR>
nmap <Leader>j :tabmove +1<CR>
nmap <C-k> :tabprevious<CR>
nmap <Leader>k :tabmove -1<CR>
nmap <Leader>w :tabclose<CR>

" Windows
nnoremap <C-c> :call tabs#close_win_save_tab()<CR>
nnoremap <C-t> :vnew<CR>
nnoremap <Esc> :cclose\|lclose\|helpclose\|pclose<CR>

" Windows
nnoremap <M-j> <C-w>w
nnoremap <M-k> <C-w>W
" Buffers
nnoremap <M-J> :bnext \| ls<CR>
nnoremap <M-K> :bprevious \| ls<CR>

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
nmap <M-n> :lnext<CR>
nmap <M-p> :lprevious<CR>

" Ctrl-Backspace to delete word
inoremap <C-H> <C-W>

" Jump to tags with AZERTY
nnoremap <Leader>g <C-]>
vnoremap <Leader>g <C-]>
nnoremap <C-H> <C-O>
nnoremap <C-L> <C-I>

" Repeat macro
nnoremap Q @@

