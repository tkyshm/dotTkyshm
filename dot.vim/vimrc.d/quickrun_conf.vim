" quickrun
let g:quickrun_config = {
            \     "_": {
            \         "runner": "vimproc",
            \         "runner/vimproc/updatetime": 40,
            \         "outputter/quickfix/open_cmd" : "",
            \     },
            \     "erlang/watchdogs_checker" : {
            \         "type" : "watchdogs_checker/flymake",
            \     },
            \     "watchdogs_checker/flymake" : {
            \         "command"   : expand('~/.vim/bundle/vim-erlang-compiler/compiler/erlang_check.erl'),
            \         "exec"      : "%c %o %s:p ",
            \     },
            \ }

call watchdogs#setup(g:quickrun_config)

" motion
nnoremap <silent>\qr :QuickRun<CR> 
