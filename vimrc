" Get script directory
let g:vimConfigPath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add this directory to the packpath
exe "set packpath+=" . fnameescape(g:vimConfigPath)
exe "set runtimepath+=" . fnameescape(g:vimConfigPath . '/runtime/')

" Load packages
packloadall

" General config files inclusion
for s:file in glob(g:vimConfigPath . '/config/*.vim', 0, 1)
    exe 'source ' . s:file
endfor

" Local config files inclusion
for s:localFile in glob(g:vimConfigPath . '/config/local/*.vim', 0, 1)
    exe 'source ' . s:localFile
endfor

" Gui-specific configuration
if has("gui_running")
    exe 'source ' . fnameescape(g:vimConfigPath) . '/gvimrc'
endif

