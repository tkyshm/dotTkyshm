" perl
"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let l = line(".")
    let c = col(".")
    :%!perltidy -q
    call cursor(l, c)
endfun

au! BufNewFile,BufRead *.tx setf tt2html
"autocmd FileType perl autocmd BufWritePre <buffer> silent :call DoTidy()
