" Get script directory
let g:vimConfigPath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add this directory to the packpath
exe "set packpath+=" . fnameescape(g:vimConfigPath)
exe "set runtimepath^=" . fnameescape(g:vimConfigPath . '/runtime/')
exe "set runtimepath+=" . fnameescape(g:vimConfigPath . '/runtime/after/')

" Gui-specific configuration
if has("gui_running")
    exe 'source ' . fnameescape(g:vimConfigPath) . '/gvimrc'
endif

