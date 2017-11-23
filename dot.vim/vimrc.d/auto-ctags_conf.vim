""--------------------------------------------
" auto-ctags setting
""--------------------------------------------
"set tags+=.git/tags,tags
""
"let g:auto_ctags = 1
"let g:auto_ctags_directory_list = ['.git']
"let g:auto_ctags_tags_args = '--tag-relative -recurse --sort=yes'
"let g:auto_ctags_filetype_mode = 1

" vim-erlang-tags setting
autocmd BufWritePost *.erl call vimproc#system_bg(
      \ '~/.config/nvim/plugged/vim-erlang-tags/bin/vim-erlang-tags.erl --otp')
