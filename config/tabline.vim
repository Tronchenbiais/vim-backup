" Always show tabline
set showtabline=2
set tabline=%!TabTitles()

augroup tabTitle
    au!
    au TabNew * let t:tabTitle='New tab'
augroup END

function! GetTabTitle(tabNr)
    let tabTitle=gettabvar(a:tabNr, 'tabTitle')
    if(tabTitle=='')
        let tabTitle='Main'
    endif
    return tabTitle
endfunction

function! SetTabTitle(tabNr, title)
    call settabvar(a:tabNr, 'tabTitle', a:title)
    " Force redrawing the tabline by doing something meaningless
    let &ro=&ro
endfunction

command! -nargs=1 T call SetTabTitle(tabpagenr(), '<args>')


function! TabTitles()
    let s = ''
    for i in range(1, tabpagenr('$'))

        let s .= '%' . i . 'T'
        let s .= '%#TabLineFill#/ %{' . i . '}:'

        if i == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= ' %{GetTabTitle(' . i . ')} '
        let s .= '%' . i . 'X%#TabLineFill#[x] '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%999T/'

    return s
endfunction

