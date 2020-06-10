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
