""--------------------------------------------
"" Golang Setting
""--------------------------------------------
set rtp+=$GOROOT/misc/vim
let $PATH=$PATH.':'.globpath($GOPATH, "bin")
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
set completeopt=menuone

autocmd FileType go autocmd BufWritePre <buffer> Fmt
