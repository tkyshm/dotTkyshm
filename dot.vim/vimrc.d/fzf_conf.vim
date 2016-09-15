" find
nnoremap <silent>,f  :<C-u>call fzf#run({'sink': 'e', 'options': '--multi --reverse'})<CR>

" grep
nnoremap ,g :<C-u>Ag 
