" Loading packages

" Fix the runtimepath on windows
set runtimepath+=~/.vim/
set packpath=~/.vim/
packloadall

" Config files inclusion
runtime! config/**/*.vim
