runtime! vimrc.d/*.vim

imap <C-e> <End>
imap <C-h> <Home>
set autoindent
set backspace=indent,eol,start
set cursorcolumn
set cursorline 
set encoding=utf-8
set expandtab 
set hlsearch
set incsearch
set laststatus=4 
set modifiable
set nocompatible
set number 
set pastetoggle=<C-b> 
set shiftwidth=4
set showmatch
set smarttab
set smartindent
set tabstop=1

" filetype
filetype plugin indent on

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

"" 画面の分割ショートカット
nnoremap <C-h>o <C-w>s
nnoremap <C-h>e <C-w>v
nnoremap <C-h>x <C-w>c

"" autocmd list
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

autocmd FileType html setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

autocmd FileType erlang setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
autocmd FileType erlang setl expandtab tabstop=8 shiftwidth=4 softtabstop=4 autoindent
au BufNewFile,BufRead *.erl setf erlang
au FileType erlang setlocal errorformat=%f:%l:\ %m

autocmd FileType go autocmd BufWritePre <buffer> Fmt<CR>
autocmd FileType go setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.go set nowrap tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" trim white space
autocmd FileType c,cpp,java,go,php,python,twig,xml,yml,erl,javascript,coffee autocmd BufWritePre <buffer> call StripTrailingWhitespace()
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Start up setting
command Vf :VimFiler -split -simple -winwidth=35 -no-quit 
let g:vimfiler_safe_mode_by_default = 0

" colorscheme
syntax on
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme tkyshm
