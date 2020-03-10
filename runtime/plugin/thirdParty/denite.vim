" view mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> v
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr><nowait> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> x
                \ denite#do_map('do_action', 'execute')
    nnoremap <silent><buffer><expr> e
                \ denite#do_map('do_action', 'edit')
    nnoremap <silent><buffer><expr> a
                \ denite#do_map('do_action', 'append')
    nnoremap <silent><buffer><expr><nowait> c
                \ denite#do_map('do_action', 'cd')
    nnoremap <silent><buffer><expr> .
                \ denite#do_map('do_previous_action')
    nnoremap <silent><buffer><expr><nowait> <LocalLeader>
                \ denite#do_map('choose_action')
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

