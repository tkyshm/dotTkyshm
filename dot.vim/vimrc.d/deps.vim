"""""""""""""""""""""""""""""""""""
"" Neobundle
"""""""""""""""""""""""""""""""""""

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim
 " call neobundle#rc(expand('~/.vim/bundle/'))
 call neobundle#begin(expand('~/.vim/bundle'))
 NeoBundleFetch 'Shougo/neobundle.vim'
 " 
 " Debug plugin
 NeoBundle 'scrooloose/syntastic'
 " originalrepos on git hub
 " vim-scripts
 NeoBundle 'vim-scripts/CSApprox'
 " Color Scheme
 NeoBundle 'tomasr/molokai'
 "NeoBundle 'ciaranm/inkpot'
 NeoBundle 'altercation/vim-colors-solarized'
 "NeoBundle 'nanotech/jellybeans'
 " sudo.vim
 NeoBundle 'sudo.vim'
 " auto ctags
 NeoBundle 'soramugi/auto-ctags.vim'
 " QuickRun
 NeoBundle 'thinca/vim-quickrun'
 " for Erlang
 NeoBundle 'jimenezrick/vimerl'
 NeoBundle 'vim-erlang/vim-erlang-tags'
 set runtimepath^=/path/to/vim-erlang-tags
 NeoBundle 'edkolev/erlang-motions.vim'
 NeoBundle 'vim-erlang/vim-erlang-omnicomplete'

 " HTML5 syntax
 NeoBundle 'othree/html5.vim'
 " Status Line plugin
 NeoBundle 'itchyny/lightline.vim'
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'tpope/vim-fugitive'
 " Regex
 NeoBundle 'terryma/vim-multiple-cursors'
 " javascript jade
 NeoBundle 'digitaltoad/vim-jade'
 NeoBundle 'briancollins/vim-jst'
 NeoBundle 'pangloss/vim-javascript'
 "
 NeoBundle 'YankRing.vim'
 " for elixir
 NeoBundle 'elixir-lang/vim-elixir'
 " for Haskel
 NeoBundle 'ujihisa/neco-ghc'
 NeoBundle 'eagletmt/unite-haddock'
 NeoBundle 'eagletmt/ghcmod-vim'
 NeoBundle 'pbrisbin/html-template-syntax'
 "" for Rails
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'tpope/vim-endwise'
 ""
 NeoBundle 'lambdalisue/platex.vim'
 NeoBundle 'taichouchou2/alpaca_powertabline'
 ""NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
 NeoBundle 'dag/vim2hs'
 NeoBundle 'Shougo/vimfiler'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/vimproc', {
       \ 'build' : {
       \     'mac' : 'make -f make_mac.mak',
       \     'unix' : 'make -f make_unix.mak',
       \    },
       \ }
 NeoBundle 'vim-ruby/vim-ruby'
 " 補完 {{{
 "NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neocomplete'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'

 function! s:bundleLoadDepends(bundle_names) "{{{
   " bundleの読み込み
   execute 'NeoBundleSource '.a:bundle_names
   au! RailsLazyPlugins
 endfunction
 "}}}
 NeoBundle 'rust-lang/rust.vim'
 NeoBundle 'racer-rust/vim-racer'
 NeoBundle 'rhysd/rust-doc.vim'

 NeoBundle 'Yggdroot/indentLine'
 "" Lua 
 NeoBundle 'xolox/vim-lua-ftplugin'
 NeoBundle 'xolox/vim-misc'
 "" vim css color
 NeoBundle 'lilydjwg/colorizer'
 "" Perl plugins
 NeoBundle 'vim-perl/vim-perl'
 "" Golang plugins 
 NeoBundle 'vim-jp/vim-go-extra'
 "" Toml syntax
 NeoBundle 'cespare/vim-toml'
 "" Slim
 NeoBundle 'slim-template/vim-slim'
 call neobundle#end()
endif


