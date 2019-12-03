" Use vifm as file explorer
nmap <C-E> :EditVifm<CR>
nmap <Leader>e :EditVifm<CR>
let g:vifm_embed_term=1

" Use bufExplorer to switch between buffers
nmap <Leader>b :BufExplorer<CR>

"================
" LanguageClient
"================

let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd-8'],
    \ }
