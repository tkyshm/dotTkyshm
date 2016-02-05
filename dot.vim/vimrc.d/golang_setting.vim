""--------------------------------------------
"" Golang Setting
""--------------------------------------------
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menuone

autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
