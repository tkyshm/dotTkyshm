""--------------------------------------------
"" Golang Setting
""--------------------------------------------
autocmd Filetype go autocmd BufWritePre <buffer> Fmt

let g:go_fmt_command = 'goimports'
set completeopt=menuone
