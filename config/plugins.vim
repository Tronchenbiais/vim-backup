"==========
" Fugitive
"==========

augroup fugitiveDiff
    au!
    au FileType fugitive 
                \nmap <silent><buffer> <Leader>d O:Gdiff<CR>
    au TabNewEntered * call FugitiveDetect(getcwd())
augroup END


"======
" Vifm
"======

nmap <Leader>e :Vifm<CR>
let g:vifm_embed_term=1

"==============
" Asyncomplete
"==============

inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

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

"=========
" Vim-lsp
"=========

let g:lsp_virtual_text_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1

nmap <Leader>a <plug>(lsp-code-action)
nmap <Leader>D <plug>(lsp-declaration)
nmap <Leader><Leader>D <plug>(lsp-peek-declaration)
nmap <Leader>d <plug>(lsp-definition)
nmap <Leader><Leader>d <plug>(lsp-peek-definition)
nmap <Leader>s <plug>(lsp-document-symbol)
nmap <Leader>E <plug>(lsp-document-diagnostics)
nmap <Leader>h <plug>(lsp-hover)
nmap <Leader>n <plug>(lsp-next-diagnostic)
nmap <Leader>p <plug>(lsp-previous-diagnostic)
nmap <M-N> <plug>(lsp-next-reference)
nmap <M-P> <plug>(lsp-previous-reference)
" nmap <Leader>n <plug>(lsp-next-error)
" nmap <Leader>a <plug>(lsp-next-warning)
" nmap <Leader>a <plug>(lsp-preview-close)
" nmap <Leader>a <plug>(lsp-preview-focus)
" nmap <Leader>a <plug>(lsp-previous-error)
" nmap <Leader>a <plug>(lsp-previous-warning)
nmap <Leader>u <plug>(lsp-references)
nmap <Leader>R <plug>(lsp-rename)
nmap <Leader>S <plug>(lsp-workspace-symbol)
" nmap <Leader>a <plug>(lsp-document-format)
" vmap <Leader>a <plug>(lsp-document-format)
" nmap <Leader>a <plug>(lsp-document-range-format)
" xmap <Leader>a <plug>(lsp-document-range-format)
nmap <Leader>i <plug>(lsp-implementation)
nmap <Leader><Leader>i <plug>(lsp-peek-implementation)
nmap <Leader>t <plug>(lsp-type-definition)
nmap <Leader><Leader>t <plug>(lsp-peek-type-definition)
nmap <Leader>T <plug>(lsp-type-hierarchy)
nmap <Leader>H <plug>(lsp-signature-help)

autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'ccls',
            \ 'cmd': ['ccls'],
            \ 'whitelist': ['c', 'cpp'],
            \ })

function! s:on_lsp_buffer_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
endfunction

augroup lsp_init
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_buffer_enabled()
augroup END

"========
" Denite
"========

" view mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> v
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> x
                \ denite#do_map('do_action', 'execute')
    nnoremap <silent><buffer><expr> e
                \ denite#do_map('do_action', 'edit')
    nnoremap <silent><buffer><expr> a
                \ denite#do_map('do_action', 'append')
    nnoremap <silent><buffer><expr> c
                \ denite#do_map('do_action', 'cd')
    nnoremap <silent><buffer><expr> .
                \ denite#do_map('do_previous_action')
    nnoremap <silent><buffer><expr> <LocalLeader><LocalLeader>
                \ denite#do_map('choose_action')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> A
                \ denite#do_map('toggle_select_all')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select')
endfunction

" filter mappings
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <Esc> <Plug>(denite_filter_update)
    inoremap <silent><buffer> <CR>
                \ <Esc>:call denite#call_map('do_action')<CR>
    imap <silent><buffer><expr> <C-x>
                \ denite#call_map('filter', '')
    inoremap <silent><buffer> <C-u>
                \ <Esc>
                \:call denite#call_map('move_up_path')<CR>
                \:call denite#call_map('open_filter_buffer')<CR>
endfunction

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
            \ ['git', 'ls-files', '-co', '--exclude-standard'])

" shortcuts
nmap <M-b> :Denite buffer<CR>
nmap <M-f> :Denite -start-filter file/rec/git<CR>
nmap <M-F> :Denite -start-filter file/rec<CR>
nmap <M-e> :call DeniteFileBrowser('')<CR>
nmap <M-h> :Denite -start-filter help<CR>
nmap <M-c> :Denite command_history<CR>
nmap <M-C> :Denite -start-filter command<CR>
nmap <M-t> :Denite -start-filter tab<CR>
nmap <M-d> :Denite -resume<CR>

function! DeniteFnameescape(dir)
    " Denite will interpret : as an argument separator, which is problematic
    " for windows absolute paths (C:\...)
    return substitute(fnameescape(a:dir), ':', '\\:', 'g')
endfunction

function! DeniteFileBrowser(dir)
    let dirname = DeniteFnameescape(a:dir)
    exe 'Denite -start-filter file::'. dirname . ' file:new'
endfunction

"============
" NeoSnippet
"============

imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)

"========
" Zeavim
"========

let g:zv_file_type =
            \{ 'haskell' : 'haskell'
            \}

let g:zv_docsets_dir =
            \has('unix')
            \? $HOME . '/.local/share/docsets'
            \: ""

let g:zv_disable_mapping = 1

nmap <Leader>z <Plug>Zeavim
vmap <Leader>z <Plug>ZVVisSelection
vmap <Leader><Leader>z <Plug>ZVKeyDocset

