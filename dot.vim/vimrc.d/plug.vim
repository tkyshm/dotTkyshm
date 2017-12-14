" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

  " Add or remove your plugins here:
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', {'do': 'make'}
  Plug 'Shougo/vimproc.vim', {'do': 'make'}

  " Perfomance improvement tools
  Plug 'Konfekt/FastFold'

  " Polyglot loads language support on demand!
  Plug 'sheerun/vim-polyglot'

  Plug 'scrooloose/syntastic' " あとで消したい
  Plug 'tpope/vim-endwise'

  " auto ctags
  Plug 'soramugi/auto-ctags.vim'

  " Documentation reference
  Plug 'thinca/vim-ref'

  " QuickRun
  Plug 'thinca/vim-quickrun'

  " for Erlang
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete'
  Plug 'vim-erlang/vim-erlang-skeletons'
  Plug 'vim-erlang/vim-dialyzer'
  Plug 'vim-erlang/vim-erlang-tags'
  Plug 'edkolev/erlang-motions.vim'
  Plug 'vim-erlang/vim-compot'

  " for Elixir
  Plug 'elixir-lang/vim-elixir'
  Plug 'slashmili/alchemist.vim', {'tag': '2.8.2'}
  Plug 'mattreduce/vim-mix'
  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist'

  " for rust
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
  Plug 'rhysd/rust-doc.vim'

  " indent guide
  Plug 'nathanaelkane/vim-indent-guides'

  " for Lua
  Plug 'xolox/vim-lua-ftplugin'
  Plug 'xolox/vim-misc'

  " for css color
  Plug 'lilydjwg/colorizer'

  " for Perl
  Plug 'vim-perl/vim-perl'

  " for Golang
  Plug 'vim-jp/vim-go-extra'
  Plug 'fatih/vim-go'

  " for Toml
  Plug 'cespare/vim-toml'

  " for Markdown
  Plug 'kannokanno/previm'
  Plug 'tyru/open-browser.vim'

  " fzf love vim
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " for python
  Plug 'lambdalisue/vim-pyenv'

  " vim-scripts
  Plug 'freeo/vim-kalisi'

  " unite
  Plug 'Shougo/unite.vim'

  " status line plugin
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " for git plugin
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/committia.vim'
  "Plug 'kmnk/vim-unite-giti.git'

  " Regex
  Plug 'terryma/vim-multiple-cursors'

  " yankring
  Plug 'vim-scripts/YankRing.vim'

  " You can specify revision/branch/tag.
  " Plug 'Shougo/vimshell', { 'rev': '3787e5' }
  Plug 'neomake/neomake'

call plug#end()

"" ここからはplugではインストールできなかったのでDeinでインストール
"if &compatible
"  set nocompatible
"endif
"
"" Required:
"set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('~/.vim')
"  call dein#begin('~/.vim')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('~/.vim/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here:
"  call dein#add('davidhalter/jedi-vim')
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
