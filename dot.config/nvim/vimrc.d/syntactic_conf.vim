""----------------------------------
" Syntactic
""----------------------------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

let g:syntastic_erlang_checkers=['escript']
let g:syntastic_ruby_checkers=['mri', 'rubylint', 'rubocop']
let g:syntastic_haskell_checkers=['ghc-mod', 'hlint', 'hdevtools']
let g:syntastic_enable_perl_checker = 1

let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['erlang','ruby','haskell','go','rust'],
  \ 'passive_filetypes': [] }

nnoremap <C-\> :lnext <CR>
nnoremap <C-\|> :lprevious <CR>
