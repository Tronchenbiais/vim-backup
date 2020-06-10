" Set custom tabline, that can be interacted with using Denite
set tabline=%!tabs#draw_tabline()

augroup tabTitle
    au!
    au TabNew * call tabs#set_title(tabpagenr(), 'New Tab')
augroup END

function! s:t_handle(bang, title) abort
    if a:bang == '!'
        call tabs#new(a:title)
    else
        call tabs#set_title(tabpagenr(), a:title)
    endif
endfunction

command! -bang -nargs=1 T call s:t_handle(<q-bang>, '<args>')

