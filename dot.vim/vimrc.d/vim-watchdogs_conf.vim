"let g:quickrun_config = {
"    \ "watchdogs_checker/_" : {
"    \     "hook/close_quickfix/enable_exit" : 1,
"    \     "runner" : "vimproc",
"    \     "runner/vimproc/updatetime" : 10,
"    \     "outputter/quickfix/open_cmd" : "",
"    \     "hook/qfstatusline_update/enable_exit" : 1,
"    \     "hook/qfstatusline_update/priority_exit" : 4,
"    \ },
"    \ "erlang/watchdogs_checker" : {
"    \     "type" : "watchdogs_checker/flymake",
"    \ },
"    \ "watchdogs_checker/flymake" : {
"    \     "command"   : expand('~/.vim/bundle/vim-erlang-compiler/compiler/erlang_check.erl'),
"    \     "exec"      : "%c %o %s:p ",
"    \ },
"    \ }
"
"call watchdogs#setup(g:quickrun_config)
"
"let g:watchdogs_check_BufWritePost_enable = 1
