Files in this directory are read during initialization (after the files in the
parent directory). This directory is ignored by git and is the place for
machine-specific configuration (especially language servers, since they may not
be installed or need the same settings on all machines.

example:
```
augroup lsp_servers
    au!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': ['ccls'],
                \ 'whitelist': ['c', 'cpp'],
                \ })
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'hie',
                \ 'cmd': ['hie', '--lsp'],
                \ 'whitelist': ['haskell'],
                \ })
augroup END
```

