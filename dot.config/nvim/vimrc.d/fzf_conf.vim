let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': 'enew' }
" find
nnoremap <silent>,f  :<C-u>call FzfFileSearch()<CR>

" grep
nnoremap ,g :<C-u>Ag 

" git status
nnoremap ,s :<C-u>GFile?<CR>

" commit history
nnoremap <silent> ,ch :<C-u>Commits<CR>


