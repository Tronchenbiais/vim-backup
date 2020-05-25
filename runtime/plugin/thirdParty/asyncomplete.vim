
imap <expr> <Tab> pumvisible() ? "\<C-n>"
            \: neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
            \: "\<Tab>"
imap <S-Tab> <C-p>
imap <expr> <Cr> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<Cr>"

smap <Tab> <Plug>(neosnippet_expand_or_jump)
inoremap <expr> <C-space> asyncomplete#force_refresh()
inoremap <expr> <C-C> pumvisible() ? asyncomplete#cancel_popup() : "\<C-C>"

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

augroup asycompleteSetup
    au!
    autocmd User asyncomplete_setup call RegisterAsyncompleteSources()
augroup END

function RegisterAsyncompleteSources()
    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': [],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))
    call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
    call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))
endfunction

