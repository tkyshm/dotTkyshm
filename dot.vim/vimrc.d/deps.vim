"""""""""""""""""""""""""""""""""""
"" Neobundle
"""""""""""""""""""""""""""""""""""
if has('vim_starting')
 "set runtimepath+=~/.config/nvim/bundle/neobundle.vim
 set runtimepath+=~/.vim/bundle/neobundle.vim
 call neobundle#begin(expand('~/.vim/bundle'))
 NeoBundleFetch 'Shougo/neobundle.vim'
 " Debug plugin
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'osyo-manga/shabadou.vim'
 NeoBundle 'osyo-manga/vim-watchdogs'
 " vim-scripts
 NeoBundle 'freeo/vim-kalisi'
 " sudo.vim
 NeoBundle 'sudo.vim'
 " auto ctags
 NeoBundle 'soramugi/auto-ctags.vim'
 NeoBundle  'alpaca-tc/alpaca_tags', {
              \    'depends': ['Shougo/vimproc'],
              \    'autoload' : {
              \       'commands' : [
              \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
              \       ],
              \    }
              \ }
 " Documentation reference
 NeoBundle 'thinca/vim-ref'
 " QuickRun
 NeoBundle 'thinca/vim-quickrun'
 " for Erlang
 NeoBundle 'vim-erlang/vim-erlang-runtime'
 NeoBundle 'vim-erlang/vim-erlang-compiler'
 NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
 NeoBundle 'vim-erlang/vim-erlang-skeletons'
 NeoBundle 'vim-erlang/vim-dialyzer'
 NeoBundle 'vim-erlang/vim-erlang-tags'
 NeoBundle 'edkolev/erlang-motions.vim'
 NeoBundle 'vim-erlang/vim-compot'

 " HTML5 syntax
 NeoBundle 'othree/html5.vim'
 " Status Line plugin
 "NeoBundle 'itchyny/lightline.vim'
 NeoBundle 'vim-airline/vim-airline'
 NeoBundle 'vim-airline/vim-airline-themes'
 " Git plugins
 NeoBundle 'airblade/vim-gitgutter'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'cohama/agit.vim'
 NeoBundle 'rhysd/committia.vim'
 NeoBundle 'kmnk/vim-unite-giti.git'

 " Regex
 NeoBundle 'terryma/vim-multiple-cursors'
 " javascript jade
 NeoBundle 'digitaltoad/vim-jade'
 NeoBundle 'briancollins/vim-jst'
 NeoBundle 'pangloss/vim-javascript'
 " YankRing
 NeoBundle 'YankRing.vim'
 "" for Rails and ruby
 NeoBundle 'vim-ruby/vim-ruby'
 NeoBundle 'basyura/unite-rails'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'tpope/vim-endwise'

 "" Filer
 NeoBundle 'Shougo/vimfiler'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'tsukkee/unite-tag'
 NeoBundle 'Shougo/vimproc', {
       \ 'build' : {
       \     'mac' : 'make -f make_mac.mak',
       \     'unix' : 'make -f make_unix.mak',
       \    },
       \ }
 " 補完 {{{
 NeoBundle 'Shougo/deoplete.nvim' 
 if has('nvim')
   NeoBundleLazy 'Shougo/deoplete.nvim', {
         \ "autoload": {"insert": 1}}
 else
   NeoBundleLazy 'Shougo/neocomplete.vim', {
         \ "autoload": {"insert": 1}}
 endif
 

 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'

 function! s:bundleLoadDepends(bundle_names)
   " bundleの読み込み
   execute 'NeoBundleSource '.a:bundle_names
   au! RailsLazyPlugins
 endfunction

 " rust
 NeoBundle 'rust-lang/rust.vim'
 NeoBundle 'racer-rust/vim-racer'
 NeoBundle 'rhysd/rust-doc.vim'

 " Indent visualization
 "NeoBundle 'Yggdroot/indentLine'
 NeoBundle 'nathanaelkane/vim-indent-guides'

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

 "" Crystal lang
 NeoBundle 'rhysd/vim-crystal'

 "" Markdown
 NeoBundle 'kannokanno/previm'
 NeoBundle 'tyru/open-browser.vim'

 "" fzf love vim
 NeoBundle 'junegunn/fzf.vim'
 NeoBundle 'junegunn/fzf'

 "" nginx vim
 NeoBundle 'vim-scripts/nginx.vim'

 "" completion for python
 NeoBundle 'davidhalter/jedi-vim'

 "" quick string quote plugins
 NeoBundle 'tpope/vim-surround'
 call neobundle#end()
endif

