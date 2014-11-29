#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# Ubuntu install
sudo apt-get install python-dev build-essential libperl-dev lua5.2 liblua5.2-dev git curl mercurial tmux
sudo apt-get install gtk-chtheme gtk2-engine compto hsetroot htop zsh
sudo apt-get install scrot
sudo apt-get install xmonad

# dot Files
#cp dot.Xdefaults ~/.Xdefaults
cp -r dot.zsh.d ~/.zsh.d
cp -r dot.vim ~/.vim
cp dot.zshrc ~/.zshrc
cp dot.vimrc ~/.vimrc
cp dot.tmux.conf ~/.tmux.conf

##
# to install
# python-dev, liblua, lua, perl, libperl
# mercurl
##
# Vim install(Ubuntu)
hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --with-features=huge \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config \
--enable-fail-if-missing \
--enable-multibyte \
--enable-perlinterp \
--enable-luainterp
make
sudo make install
cd $SCRIPT_DIR

# Vimの初期設定
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -c NeoBundleInstall

# ruby configuration
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset

# Fonts Configuration
cd $SCRIPT_DIR
mkdir -p ~/.fonts
cp $SCRIPT_DIR/fonts/Inconsolata+for+Powerline.otf ~/.fonts
cp $SCRIPT_DIR/fonts/PowerlineSymbols.otf ~/.fonts

git clone https://github.com/yascentur/Ricty ~/Ricty
cd ~/Ricty
wget http://levien.com/type/myfonts/Inconsolata.otf
wget -O mig1m.zip 'http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F57240%2Fmigu-1m-20121030.zip'
unzip mig1m.zip
rm mig1m.zip 
sh ricty_generator.sh auto
cp Ricty-Regular.ttf Ricty-Bold.ttf ~/.vim/bundle/powerline/font
cd ~/.vim/bundle/powerline/font
fontforge -lang=py -script fontpatcher.py Ricty-Regular.ttf
fontforge -lang=py -script fontpatcher.py Ricty-Bold.ttf
cp -f Ricty* ~/.fonts
fc-cache -vf
cd $SCRIPT_DIR

# Erlangの設定
curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
mkdir ~/bin
mv kerl ~/bin
chmod a+x ~/bin/kerl
echo 'KERL_CONFIGURE_OPTIONS="--disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll" ' > ~/.kerlrc

~/bin/kerl list releases 
~/bin/kerl update releases 
#~/bin/kerl releases 


## Install golang
wget https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz
mv go1.3.3.linux-amd64.tar.gz /usr/local
cd /usr/local/
tar -xvf go1.3.3.linux-amd64.tar.gz
cd
echo "export GOROOT=/usr/local/go" >> .zshrc.mine
echo "export GOPATH=$HOME/gocobe" >> .zshrc.mine
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> .zshrc.mine
source .zshrc
go get github.com/nsf/gocode
