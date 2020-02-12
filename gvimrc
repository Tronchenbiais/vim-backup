set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=e

" nvim-qt needs a little hack for tabline
if(has('nvim'))
    GuiTabLine 0
endif

