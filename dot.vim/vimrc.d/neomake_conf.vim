autocmd! BufWritePost,BufEnter * Neomake

"" disable erlang neomake because of using other checker plugin.
let g:neomake_erlang_enabled_makers = []
