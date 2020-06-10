function! tabs#close_win_save_tab()
    if len(gettabinfo(tabpagenr())[0]['windows']) > 1
        close
    else
        let choice = confirm(
                    \"Close tab?",
                    \"&Yes\n&No\n&Cancel")
        if choice == 1
            quit!
        elseif choice == 2
            enew!
        endif
    endif
endfun

function! tabs#get_title(tabNr)
    let tabTitle=gettabvar(a:tabNr, 'tabTitle')
    if(tabTitle=='')
        let tabTitle='Main'
    endif
    return tabTitle
endfunction

function! tabs#set_title(tabNr, title)
    call settabvar(a:tabNr, 'tabTitle', a:title)
    " Force redrawing the tabline by doing something meaningless
    let &ro=&ro
endfunction

function! tabs#new(title) abort
    tabnew
    call tabs#set_title(tabpagenr(), a:title)
endfunction

function! tabs#draw_tabline()
    highlight TabLine guibg=#45403d guifg=#a89984
    highlight TabLineSel gui=bold guibg=#45403d guifg=#fe8019
    highlight TabLineFill guibg=#45403d guifg=#7c6f64

    let s = ''
    for i in range(1, tabpagenr('$'))

        let s .= '%' . i . 'T'
        let s .= '%#TabLineFill#/ %{' . i . '}: '

        if i == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%{tabs#get_title(' . i . ')}'
        let s .= '%#TabLineFill# %' . i . 'X[x] '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%999T/'

    return s
endfunction

