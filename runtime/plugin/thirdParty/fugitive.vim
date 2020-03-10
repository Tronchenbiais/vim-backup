

augroup fugitiveDiff
    au!
    au FileType fugitive 
                \nmap <silent><buffer> <Leader>d O:Gdiff<CR>
    au TabNewEntered * call FugitiveDetect(getcwd())
augroup END
