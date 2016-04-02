let g:ref_use_vimproc = 1
let g:ref_open = 'split'
let g:ref_cache_dir = expand($HOME . '/erlang/vim_ref_cache/')
nno ,K :<C-u>Unite ref/erlang
            \ -vertical -default-action=split<CR>
