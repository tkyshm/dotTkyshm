" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer', 'tag']
let g:deoplete#sources.elixir = ['alchemist']
