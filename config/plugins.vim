" Use vifm as file explorer
nmap <C-E> :EditVifm<CR>
nmap <Leader>e :EditVifm<CR>
let g:vifm_embed_term=1

" Use bufExplorer to switch between buffers
nmap <Leader>b :BufExplorer<CR>

" Use xmledit for html, php, xhtml
let g:xmledit_enable_html=1

" Use emmet for html and css and the like
let g:user_emmet_install_global = 0
autocmd FileType html,xhtml,php,css EmmetInstall
