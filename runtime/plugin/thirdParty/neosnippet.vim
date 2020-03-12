" To enable custom snippets for a language:
" - Copy the snippet file for desired filetype to the dir specified below
" - Add the `'filetype' : 1,` to the dict below to avoid conflicts
let g:neosnippet#snippets_directory = g:vim_config_dir . "/snippets"
let g:neosnippet#disable_runtime_snippets = 
            \{
            \}

