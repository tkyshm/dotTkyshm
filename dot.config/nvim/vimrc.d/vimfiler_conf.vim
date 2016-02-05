"----------
" VimFiler
"----------
" Buffer list
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" IDE風にbufferを開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" Start up setting
command Vf :VimFiler -split -simple -winwidth=35 -no-quit 
let g:vimfiler_safe_mode_by_default = 0


