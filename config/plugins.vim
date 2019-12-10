"================
" LanguageClient
"================

nmap <C-E> :EditVifm<CR>
nmap <Leader>e :EditVifm<CR>
let g:vifm_embed_term=1

"================
" LanguageClient
"================

let g:LanguageClient_selectionUI="quickfix"
let g:LanguageClient_diagnosticsList="Location"
let g:LanguageClient_useFloatingHover=1

nmap <LocalLeader><LocalLeader> :call LanguageClient_contextMenu()<CR>
nmap <LocalLeader>h :call LanguageClient_textDocument_hover()<CR>
nmap <LocalLeader>d :call LanguageClient_textDocument_definition()<CR>
nmap <LocalLeader>i :call LanguageClient_textDocument_implementation()<CR>
nmap <LocalLeader>r :call LanguageClient_textDocument_references()<CR>
nmap <LocalLeader>e :call LanguageClient#explainErrorAtPoint()<CR>

augroup LanguageClient_config
    au BufEnter * let b:Plugin_LanguageClient_started=0
    au User LanguageClientStarted setl signcolumn=yes
    au User LanguageClientStarted let b:Plugin_LanguageClient_started=1
    au User LanguageClientStarted call SuperTabChain(&omnifunc, '<c-n>')
    au User LanguageClientStopped setl signcolumn=auto
    au User LanguageClientStopped let b:Plugin_LanguageClient_started=0
    if has('nvim')
        au CursorMoved * 
                    \ if b:Plugin_LanguageClient_started |
                    \ silent call LanguageClient#textDocument_documentHighlight() |
                    \ silent call LanguageClient#textDocument_hover() |
                    \ endif
    endif
augroup END

"========
" Denite
"========

" view mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction

" filter mappings
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" shortcuts
nmap <Leader>b :Denite buffer<CR>
nmap <Leader>f :Denite file/rec<CR>
nmap <Leader>h :Denite help<CR>
nmap <Leader>c :Denite command_history<CR>
nmap <Leader>C :Denite command<CR>
nmap <Leader>s :Denite documentSymbol<CR>
nmap <Leader>S :Denite workspaceSymbol<CR>

"============
" NeoSnippet
"============

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"==========
" Deoplete
"==========

call deoplete#custom#option('auto_complete', v:false)

call deoplete#custom#option('source',
            \ { '_' : 'buffer' })

inoremap <C-Space> deoplete#manual_complete('file')

" Supertab emulation
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
