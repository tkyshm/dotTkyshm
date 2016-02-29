"====================================
" Unite Setting
"===================================
" UB でBUffer検索する
nnoremap <silent>,b :<C-u>Unite -start-insert buffer<CR>
" UF でファイル名検索する
"nnoremap <silent>,f :<C-u>Unite -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
"nnoremap ,f  :<C-u>Unite find:<CR>
nnoremap <silent>,f  :<C-u>Unite -start-insert file_rec:.<CR>
" UG or ,g で全文検索する
nnoremap <silent>,g :<C-u>Unite -start-insert grep:.<CR>

"=====================================
" Unite ag
"=====================================

if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --hidden -g ""'
  ""let g:unite_source_rec_async_command=['ag', '--nocolor', '--nogroup', '--hidden', '-g', '""']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  ""let g:unite_enable_smart_case
endif

"if executable('csearch') 
"  let g:unite_source_find_command = 'csearch'
"  let g:unite_source_find_default_opts = '-l'
"endif