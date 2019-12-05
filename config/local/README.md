Files in this directory are read during initialization (after the files in the
parent directory). You can put personnal settings here.

example:
```
 let g:LanguageClient_serverCommands={
    \ 'c': ['cquery'],
    \ 'cpp': ['cquery'],
    \ }
```

