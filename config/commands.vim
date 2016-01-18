" Prolog
:command Prolog !rlwrap sicstus -l "%"

" Pandoc to Beamer
:command PandocBeamer !pandoc -st beamer -V theme:Singapore -V colortheme:rose % -o %:r.pdf
:command PandocLatex !pandoc -st latex % -o %:r.pdf
" Pandoc syntax coloring
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.mkd set filetype=markdown.pandoc
augroup END
