let g:zv_file_type =
            \{ 'haskell' : 'haskell'
            \}

let g:zv_docsets_dir =
            \has('unix')
            \? $HOME . '/.local/share/docsets/Zeal/Zeal/docsets'
            \: ""

let g:zv_disable_mapping = 1

nmap <Leader>z <Plug>Zeavim
vmap <Leader>z <Plug>ZVVisSelection
vmap <Leader><Leader>z <Plug>ZVKeyDocset

