" Loading packages

" Fix the runtimepath on windows
set runtimepath+=$VIM/vimconfig
set packpath=$VIM/vimconfig
packloadall

" Config files inclusion
runtime! config/**/*.vim
