"" Flags
"let s:use_dein = 1
"
"" vi compatibility
"if !&compatible
"  set nocompatible
"endif
"
"" Prepare .vim dir
"let s:vimdir = $HOME . "/.vim"
"if has("vim_starting")
"  if ! isdirectory(s:vimdir)
"    call system("mkdir " . s:vimdir)
"  endif
"endif
"
"" dein
"let s:dein_enabled  = 0
"if s:use_dein && v:version >= 704
"  let s:dein_enabled = 1
"
"  " Set dein paths
"  let s:dein_dir = s:vimdir . '/dein'
"  let s:dein_github = s:dein_dir . '/repos/github.com'
"  let s:dein_repo_name = "Shougo/dein.vim"
"  let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name
"
"  " Check dein has been installed or not.
"  if !isdirectory(s:dein_repo_dir)
"    echo "dein is not installed, install now "
"    let s:dein_repo = "https://github.com/" . s:dein_repo_name
"    echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
"    call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
"  endif
"  let &runtimepath = &runtimepath . "," . s:dein_repo_dir
"
"  " Begin plugin part
"  call dein#begin(s:dein_dir)
"
"  " Check cache
"  if dein#load_cache()
"
"    call dein#add('Shougo/dein.vim')
"
"    call dein#add('Shougo/vimproc', {
"          \ 'build': {
"          \     'windows': 'tools\\update-dll-mingw',
"          \     'cygwin': 'make -f make_cygwin.mak',
"          \     'mac': 'make -f make_mac.mak',
"          \     'linux': 'make',
"          \     'unix': 'gmake'}})
"
"    call dein#add('Shougo/unite.vim', {
"          \ 'depends': ['vimproc'],
"          \ 'on_cmd': ['Unite'],
"          \ 'lazy': 1})
"
"    if has('lua')
"      call dein#add('Shougo/neocomplete.vim', {
"            \ 'on_i': 1,
"            \ 'lazy': 1})
"
"      call dein#add('ujihisa/neco-look', {
"            \ 'depends': ['neocomplete.vim']})
"    endif
"
"    call dein#add('tyru/open-browser.vim', {
"          \ 'on_map': ['<Plug>(openbrowser-smart-search)'],
"          \ 'lazy': 1})
"
"    call dein#save_cache()
"  endif
"
"  call dein#end()
"
"  " Installation check.
"  if dein#check_install()
"    call dein#install()
"  endif
"endif
