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
let g:vifm_embed_term=1

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
nmap <Leader>b :Denite buffer<CR>
nmap <Leader>f :Denite -start-filter file/rec/git<CR>
nmap <Leader>F :Denite -start-filter file/rec<CR>
nmap <Leader>e :call DeniteFileBrowser('')<CR>
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

nnoremap <Leader>z <Plug>Zeavim
vnoremap <Leader>z <Plug>ZVVisSelection
vnoremap <Leader><Leader>z <Plug>ZVKeyDocset

