" quickrun
let g:quickrun_config = {
            \     "_": {
            \         "hook/close_buffer/enable_failure" : 1,
            \         "hook/close_buffer/enable_empty_data" : 1,
            \         "hook/shabadoubi_touch_henshin/enable" : 1,
            \         "hook/shabadoubi_touch_henshin/wait" : 20,
            \         "runner": "vimproc",
            \         "runner/vimproc/updatetime": 40,
            \     }
            \ }

" motion
nnoremap <silent>\qr :QuickRun<CR> 
