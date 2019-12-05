" Get script directory
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Add this directory to the packpath
exe "set packpath+=" . fnameescape(s:path)

" Load packages
packloadall

" General config files inclusion
for s:file in glob(s:path . '/config/*.vim', 0, 1)
  exe 'source ' . s:file
endfor

" Local config files inclusion
for s:file in glob(s:path . '/config/local/*.vim', 0, 1)
  exe 'source ' . s:file
endfor

" Gui-specific configuration
if has("gui_running")
    exe 'source ' . fnameescape(s:path) . '/gvimrc'
endif
