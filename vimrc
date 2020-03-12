" Get script directory
let g:vim_config_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add this directory to the packpath
exe "set packpath+=" . fnameescape(g:vim_config_dir)
exe "set runtimepath^=" . fnameescape(g:vim_config_dir . '/runtime/')
exe "set runtimepath+=" . fnameescape(g:vim_config_dir . '/runtime/after/')
" General config files inclusion
for s:file in glob(g:vim_config_dir . '/config/*.vim', 0, 1)
    exe 'source ' . s:file
endfor

" Files to source before loading plugins
runtime! before/*.vim

" Gui-specific configuration
if has("gui_running")
    exe 'source ' . fnameescape(g:vim_config_dir) . '/gvimrc'
endif

