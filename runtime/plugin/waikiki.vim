let g:waikiki_create_type='ext'
let g:waikiki_default_maps=0

function WikiPageSetup() abort
    nmap <buffer> <cr> <Plug>(waikikiFollowLink)
    nmap <buffer> <LocalLeader><cr> <Plug>(waikikiFollowLinkVSplit)
    nmap <buffer> <bs> <Plug>(waikikiGoUp)
    nmap <buffer> <C-n> <Plug>(waikikiNextLink)
    nmap <buffer> <C-p> <Plug>(waikikiPrevLink)
    nmap <buffer> <C-Space> <Plug>(waikikiToggleListItem)
    nmap <buffer> <LocalLeader>T <Plug>(waikikiTags)
    let b:wiki_buffer_setup = 1
endfun

augroup Waikiki
    au!
    autocmd User setup call WikiPageSetup()
augroup END
