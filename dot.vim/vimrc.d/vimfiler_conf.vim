"----------
" VimFiler
"----------
" Buffer list
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" IDE風にbufferを開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
