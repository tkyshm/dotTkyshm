""----------------------------------
" Syntactic
""----------------------------------
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

"let g:syntastic_erlang_checkers=['escript']
let g:syntastic_ruby_checkers=['mri', 'rubylint', 'rubocop']
let g:syntastic_haskell_checkers=['ghc-mod', 'hlint', 'hdevtools']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': ['ruby','haskell','go','rust'],
  \ 'passive_filetypes': ['erlang', 'elixir'] }

nnoremap <C-\> :lnext <CR>
nnoremap <C-\|> :lprevious <CR>

"" python autopep8
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

" Shift + F で自動修正
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
