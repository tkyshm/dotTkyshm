""--------------------------------------------
"" Golang Setting
""--------------------------------------------
let g:go_fmt_command = 'goimports'
autocmd Filetype go autocmd BufWritePre <buffer> Fmt
set completeopt=menuone

let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']
