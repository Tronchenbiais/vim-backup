" Pandoc to Beamer
":command PandocBeamer !pandoc -st beamer -V theme:Singapore -V colortheme:rose % -o %:r.pdf
:command PandocLatex !pandoc -st latex % -o %:r.pdf

:command Vimrc exe 'Denite -start-filter file/rec:' . DeniteFnameescape(g:vimConfigPath)

