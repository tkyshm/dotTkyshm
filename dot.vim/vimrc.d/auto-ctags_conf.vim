""--------------------------------------------
" auto-ctags setting
""--------------------------------------------
set tags+=.git/tags
set tags+=.svn/tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
