" =======
" GENERAL
" =======

" Leader keys
let mapleader="ù"
let maplocalleader="_"

" Tabbing shortcuts
nmap <Leader>t :tabnew<CR>
nmap <C-K> :tabnext<CR>
nmap <Leader>k :tabmove +1<CR>
nmap <C-J> :tabprevious<CR>
nmap <Leader>j :tabmove -1<CR>
nmap <Leader>w :tabclose<CR>

" Windows
nnoremap <C-C> <C-W>c
nnoremap <C-X> :vnew<CR>
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
inoremap (<CR> (<CR><ESC>a)<ESC>O
inoremap (<Space> (<ESC>a)<ESC>i
inoremap [<CR> [<CR><ESC>a]<ESC>O
inoremap [<Space> [<ESC>a]<ESC>i
inoremap {<CR> {<CR><ESC>a}<ESC>O
inoremap {<Space> {<ESC>a}<ESC>i
inoremap "<Space> "<ESC>a"<ESC>i

" Building
nmap <Leader>m :silent make!\|redraw!\|cc<CR>
nmap <Leader>r :make! run<CR>
nmap <C-n> :cnext<CR>
nmap <C-p> :cprevious<CR>
nmap <Leader>n :lnext<CR>
nmap <Leader>p :lprevious<CR>

" Insert mode movements
inoremap <C-A> <C-O>I
inoremap <C-E> <C-O>A
inoremap <Leader><Leader> <ESC>
" Ctrl-Backspace to delete word
inoremap <C-BS> <C-W>

" Jump to tags with AZERTY
nnoremap <Leader>g <C-]>
vnoremap <Leader>g <C-]>
nnoremap <C-H> <C-O>
nnoremap <C-L> <C-I>

" Repeat macro
nnoremap Q @@

" ==========================
" LANGUAGE SPECIFIC MAPPINGS
" ==========================

" Rust
if has('autocmd')
    augroup PersonalRustMappings
        autocmd!
        autocmd BufRead *.rs map <LocalLeader>r :RustRun<CR>
    augroup END
endif

