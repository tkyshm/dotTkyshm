""--------------------------------------------
"" Golang Setting
""--------------------------------------------
set rtp+=$GOROOT/misc/vim
let $PATH=$PATH.':'.globpath($GOPATH, "bin")
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menuone

let g:go_fmt_command = "goimports"

let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

autocmd FileType go autocmd BufWritePre <buffer> Fmt
