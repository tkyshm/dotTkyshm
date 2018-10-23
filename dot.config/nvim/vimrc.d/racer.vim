set hidden
let g:racer_experimental_completer = 1
let g:racer_cmd="$HOME/.cargo/bin/racer"

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h')
