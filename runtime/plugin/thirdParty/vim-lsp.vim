let g:lsp_virtual_text_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlight_references_enabled = 1

nmap <Leader>a <plug>(lsp-code-action)
nmap <Leader>D <plug>(lsp-declaration)
nmap <Leader><Leader>D <plug>(lsp-peek-declaration)
nmap <Leader>d <plug>(lsp-definition)
nmap <Leader><Leader>d <plug>(lsp-peek-definition)
nmap <Leader>s <plug>(lsp-document-symbol)
nmap <Leader>E <plug>(lsp-document-diagnostics)
nmap <Leader>h <plug>(lsp-hover)
nmap <Leader>n <plug>(lsp-next-diagnostic)
nmap <Leader>p <plug>(lsp-previous-diagnostic)
nmap <M-N> <plug>(lsp-next-reference)
nmap <M-P> <plug>(lsp-previous-reference)
" nmap <Leader>n <plug>(lsp-next-error)
" nmap <Leader>a <plug>(lsp-next-warning)
" nmap <Leader>a <plug>(lsp-preview-close)
" nmap <Leader>a <plug>(lsp-preview-focus)
" nmap <Leader>a <plug>(lsp-previous-error)
" nmap <Leader>a <plug>(lsp-previous-warning)
nmap <Leader>u <plug>(lsp-references)
nmap <Leader>R <plug>(lsp-rename)
nmap <Leader>S <plug>(lsp-workspace-symbol)
" nmap <Leader>a <plug>(lsp-document-format)
" vmap <Leader>a <plug>(lsp-document-format)
" nmap <Leader>a <plug>(lsp-document-range-format)
" xmap <Leader>a <plug>(lsp-document-range-format)
nmap <Leader>i <plug>(lsp-implementation)
nmap <Leader><Leader>i <plug>(lsp-peek-implementation)
nmap <Leader>t <plug>(lsp-type-definition)
nmap <Leader><Leader>t <plug>(lsp-peek-type-definition)
nmap <Leader>T <plug>(lsp-type-hierarchy)
nmap <Leader>H <plug>(lsp-signature-help)


function! s:on_lsp_buffer_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
endfunction

augroup lsp_init
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_buffer_enabled()
augroup END

