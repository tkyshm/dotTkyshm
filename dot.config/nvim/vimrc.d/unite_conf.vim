"====================================
" Unite Setting
"===================================
" UB でBUffer検索する
nnoremap <silent>,b :<C-u>Buffers<CR>
"
"" UF でファイル名検索する
"nnoremap <silent>,u :<C-u>Unite -start-insert file_rec/async<CR>
"
"" Unite tab
"nnoremap <silent> ,t  :<C-u>Unite tab<CR>
"
"call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '_build/.*')
"let g:unite_source_rec_max_cache_files = 60000
""=====================================
"" Unite ag
""=====================================
"if executable('ag')
"  "let g:unite_source_file_async_command = 'ag -l --nocolor --nogroup'
"  "let g:unite_source_rec_async_command = 
"  "            \ ['ag', '--follow', '--nocolor', '--nogroup',
"  "            \  '--hidden', '-g', '']
"  let g:unite_source_grep_command = 'ag'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"  let g:unite_source_grep_recursive_opt = ''
"endif

"if executable('csearch') 
"  let g:unite_source_find_command = 'csearch'
"  let g:unite_source_find_default_opts = '-l'
"endif
