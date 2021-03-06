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
set modifiable
set nocompatible
set number
set pastetoggle=<C-b>
set shiftwidth=4
set showmatch
set smarttab
set smartindent
set tabstop=1
set clipboard=unnamedplus,autoselect

let mapleader = "<Space>"

" filetype
filetype plugin indent on

" jsonのダブルクォート非表示機能OFF
autocmd Filetype json setl conceallevel=0

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

"" 画面の分割ショートカット
nnoremap <C-h>o <C-w>s
nnoremap <C-h>e <C-w>v
nnoremap <C-h>x <C-w>c

"" insert completion
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>

inoremap {<Enter> {}<left><CR><ESC><S-o>
inoremap [<Enter> []<left><CR><ESC><S-o>
inoremap (<Enter> ()<left><CR><ESC><S-o>

"" buffer motion
nnoremap <silent>bn :bn<CR>
nnoremap <silent>bd :bd<CR>
nnoremap <silent>bp :bp<CR>

"" autocmd list
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent
autocmd FileType eruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

autocmd FileType yaml setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent

autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType html setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" perl
au! BufNewFile,BufRead *.tx setf tt2html

" erlang
autocmd FileType erlang setl expandtab shiftwidth=4 tabstop=4 softtabstop=4
au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl setf erlang
"autocmd FileType erlang autocmd BufWritePre <buffer> call Indent()

autocmd FileType go setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.go set nowrap tabstop=4 shiftwidth=4 softtabstop=4 autoindent

autocmd FileType javascript setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.js set nowrap tabstop=2 shiftwidth=2 softtabstop=2 autoindent

" baal
autocmd BufRead,BufNewFile *.faced setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab fileformat=unix encoding=utf-8
autocmd BufRead,BufNewFile *.tmpl setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab fileformat=unix encoding=utf-8

" colorscheme
syntax on
set t_Co=256
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized
"let g:lucius_style='light'
"let g:lucius_contrast='high'
"let g:lucius_no_term_bg=1
"colorscheme lucius
colorscheme umineko

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" 
hi WhitespaceEOL ctermbg=219 guibg=#f89183
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/
