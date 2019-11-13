" Get script directory
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Loading packages
packloadall

" Config files inclusion
for s:file in glob(s:path . '/config/**/*.vim', 0, 1)
  exe 'source ' . s:file
endfor
