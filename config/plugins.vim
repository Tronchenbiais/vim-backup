"================
" LanguageClient
"================

nmap <C-E> :EditVifm<CR>
nmap <Leader>e :EditVifm<CR>
let g:vifm_embed_term=1

"================
" LanguageClient
"================

let g:LanguageClient_selectionUI="quickfix"
let g:LanguageClient_diagnosticsList="Location"
let g:LanguageClient_useFloatingHover=1

nmap <LocalLeader><LocalLeader> :call LanguageClient_contextMenu()<CR>
nmap <LocalLeader>s :call LanguageClient_textDocument_documentSymbol()<CR>
nmap <LocalLeader>h :call LanguageClient_textDocument_hover()<CR>
nmap <LocalLeader>d :call LanguageClient_textDocument_definition()<CR>
nmap <LocalLeader>i :call LanguageClient_textDocument_implementation()<CR>
nmap <LocalLeader>r :call LanguageClient_textDocument_references()<CR>
nmap <LocalLeader>f :call LanguageClient_textDocument_formatting()<CR>
nmap <LocalLeader>u :call LanguageClient_textDocument_documentHighlight()<CR>
nmap <LocalLeader>e :call LanguageClient#explainErrorAtPoint()<CR>

augroup LanguageClient_config
    au BufEnter * let b:Plugin_LanguageClient_started=0
    au User LanguageClientStarted setl signcolumn=yes
    au User LanguageClientStarted let b:Plugin_LanguageClient_started=1
    au User LanguageClientStarted call SuperTabChain(&omnifunc, '<c-n>')
    au User LanguageClientStopped setl signcolumn=auto
    au User LanguageClientStopped let b:Plugin_LanguageClient_started=0
    if has('nvim')
        au CursorMoved * 
                    \ if b:Plugin_LanguageClient_started |
                    \ silent call LanguageClient#textDocument_documentHighlight() |
                    \ silent call LanguageClient#textDocument_hover() |
                    \ endif
    endif
augroup END

"=====
" FZF
"=====

let g:fzf_command_prefix='Fzf'

nmap <Leader>b :FzfBuffers<CR>
nmap <Leader>f :FzfFiles<CR>
nmap <Leader>h :FzfHelptags<CR>
nmap <Leader>c :FzfCommands<CR>

" What is this
nmap <leader><tab> <plug>(fzf-maps-n)

"============
" NeoSnippet
"============

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

"==========
" Supertab
"==========

let g:SuperTabLongestEnhanced=1
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabRetainCompletionDuration='completion'

