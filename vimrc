" Get script directory
let g:vimConfigPath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add this directory to the packpath
exe "set packpath+=" . fnameescape(g:vimConfigPath)
exe "set runtimepath^=" . fnameescape(g:vimConfigPath . '/runtime/')
exe "set runtimepath+=" . fnameescape(g:vimConfigPath . '/runtime/after/')
" General config files inclusion
for s:file in glob(g:vimConfigPath . '/config/*.vim', 0, 1)
    exe 'source ' . s:file
endfor

" Files to source before loading plugins
runtime! before/*.vim

" Gui-specific configuration
if has("gui_running")
    exe 'source ' . fnameescape(g:vimConfigPath) . '/gvimrc'
endif

