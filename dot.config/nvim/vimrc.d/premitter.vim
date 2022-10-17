let g:prettier#exec_cmd_path = "/usr/local/node/bin/prettier"
autocmd FileType scss,css autocmd BufWritePre <buffer> Prettier
