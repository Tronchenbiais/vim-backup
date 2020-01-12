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

nmap <C-E> :EditVifm<CR>
nmap <Leader>e :EditVifm<CR>
let g:vifm_embed_term=1

"================
" LanguageClient
"================

let g:LanguageClient_autoStart=0
let g:LanguageClient_selectionUI="quickfix"
let g:LanguageClient_diagnosticsList="Location"
let g:LanguageClient_useFloatingHover=1

nmap <LocalLeader><LocalLeader> :Denite -start-filter contextMenu<CR>
nmap <LocalLeader>h :call LanguageClient_textDocument_hover()<CR>
nmap <LocalLeader>d :call LanguageClient_textDocument_definition()<CR>
nmap <LocalLeader>i :call LanguageClient_textDocument_implementation()<CR>
nmap <LocalLeader>r :call LanguageClient_textDocument_references()<CR>
nmap <LocalLeader>e :call LanguageClient#explainErrorAtPoint()<CR>
nmap <LocalLeader>s :Denite -start-filter documentSymbol<CR>
nmap <LocalLeader>S :Denite -start-filter -filter-updatetime=0 workspaceSymbol<CR>

augroup LanguageClient_config
    au!
    au BufEnter * call CheckLCisAlive()
    au User LanguageClientStarted bufdo call CheckLCisAlive()
    au User LanguageClientStopped bufdo call CheckLCisAlive()
    au CursorMoved * call HandleCursorMoved()
augroup END

function! CheckLCisAlive() abort
    if(exists('g:LanguageClient_loaded') && g:LanguageClient_loaded == 1)
        call LanguageClient#isAlive(funcref('LCisAliveCallback', [bufnr('')]))
    endif
endfunction

function! LCisAliveCallback(bufnr, message) abort
    if a:message.result is v:true
        call setbufvar(a:bufnr, "LanguageServer_alive", 1)
        call setbufvar(a:bufnr, "&signcolumn", "yes")
    else
        call setbufvar(a:bufnr, "LanguageServer_alive", 0)
        call setbufvar(a:bufnr, "&signcolumn", "auto")
    endif
endfunction

function! HandleCursorMoved() abort
    if exists('b:LanguageServer_alive') && b:LanguageServer_alive
        silent call LanguageClient#textDocument_documentHighlight()
    endif
endfunction

let g:LanguageClient_documentHighlightDisplay=
            \{
            \1: {
            \"name": "Text",
            \"texthl": "StatusLine",
            \},
            \2: {
            \"name": "Read",
            \"texthl": "StatusLineNC",
            \},
            \3: {
            \"name": "Write",
            \"texthl": "StatusLineNC",
            \},
            \}

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
    nnoremap <silent><buffer><expr> _
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

" shortcuts
nmap <Leader>b :Denite buffer<CR>
nmap <Leader>f :Denite -start-filter file/rec<CR>
nmap <Leader>F :call DeniteFileBrowser('')<CR>
nmap <Leader>h :Denite -start-filter help<CR>
nmap <Leader>c :Denite command_history<CR>
nmap <Leader>C :Denite -start-filter command<CR>
nmap <Leader>t :Denite -start-filter tab<CR>
nmap <Leader>d :Denite -resume<CR>

function! DeniteFnameescape(dir)
    " Denite will interpret : as an argument separator, which is problematic
    " for windows absolute paths (C:\...)
    return substitute(fnameescape(a:dir), ':', '\\:', 'g')
endfunction

function! DeniteFileBrowser(dir)
    let dirname = DeniteFnameescape(dir)
    exe 'Denite -start-filter file::'. dirname . ' file:new'
endfunction

"==========
" Deoplete
"==========

call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('auto_complete', v:false)

" Source config

call deoplete#custom#source('neosnippet', {
            \ 'rank': 1000,
            \ 'sorters': ['sorter_word'],
            \ 'matchers': ['matcher_head']
            \ })

call deoplete#custom#option('sources', {
            \ '_': ['buffer', 'file', 'neosnippet', 'LanguageClient'],
            \ })

call deoplete#custom#option('ignore_sources', {
            \ 'c': ['buffer'],
            \ 'cpp': ['buffer']
            \ })

augroup autocomplete_filetypes
    autocmd!
    autocmd FileType c,cpp call deoplete#custom#buffer_option('auto_complete', v:true)
augroup END


" Supertab emulation
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()
inoremap <silent><expr> <S-TAB>
            \ pumvisible() ? "\<C-p>" :
            \ deoplete#manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use deoplete.
call deoplete#enable()

"============
" NeoSnippet
"============

imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)

