""--------------------------------------------
"" Golang Setting
""--------------------------------------------
let g:go_fmt_command = 'goimports'
autocmd Filetype go autocmd BufWritePre <buffer> Fmt
