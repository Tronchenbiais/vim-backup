" Tabbing shortcuts
nmap <C-T> :tabnew<CR>
nmap <C-J> :tabnext<CR>
nmap <C-L> :tabmove +1<CR>
nmap <C-K> :tabprevious<CR>
nmap <C-H> :tabmove -1<CR>
nmap <C-X> :tabclose<CR>

" Moving between splits with Ctrl-Tab
nmap <C-Tab> <C-W>w
nmap <C-S-Tab> <C-W>W

" Switching between buffers
nmap ù :ls<CR>:b

" Spell Checking
nnoremap zs 1z=

" Auto-closing brackets and quotes
inoremap (( (<ESC>a)<ESC>i
inoremap [[ [<ESC>a]<ESC>i
inoremap {{ {<ESC>a}<ESC>i
inoremap "" "<ESC>a"<ESC>i

" Insert mode movements
inoremap <C-A> <ESC>I
inoremap <C-E> <ESC>A
inoremap <C-W> <ESC>ea
inoremap <C-B> <ESC>bi

" Ctrl-Backspace deletes words
inoremap <C-Bs> <C-W>
