#!/bin/bash
echo -e "\e[32m<< Install script for Ubuntu >>\e[39m"
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# Ubuntu install
sudo apt-get update
sudo apt-get install build-essential lua5.2 git curl mercurial tmux openssl
sudo apt-get install libssl-dev zlib1g zlib1g-dev libperl-dev liblua5.2-dev python-dev
sudo apt-get install gtk-chtheme gtk2-engine compto hsetroot htop zsh
sudo apt-get install scrot
sudo apt-get install xmonad

# GTK themes install(Numix).
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme numix-icon-theme-circle numix-gtk-theme numix-tools

# dot Files
#cp dot.Xdefaults ~/.Xdefaults
echo -e "\e[34m[INFO] Setting my dot files.\e[39m"
cp -r dot.zsh.d ~/.zsh.d
echo -e "\e[34m[INFO] Copy dot.zsh.d to home directory.\e[39m"
cp dot.zshrc ~/.zshrc
echo -e "\e[34m[INFO] Copy dot.zshrc to home directory.\e[39m"
cp -r dot.vim ~/.vim
echo -e "\e[34m[INFO] Copy dot.vim to home directory.\e[39m"
cp dot.vimrc ~/.vimrc
echo -e "\e[34m[INFO] Copy dot.vimrc to home directory.\e[39m"
cp dot.tmux.conf ~/.tmux.conf
echo -e "\e[34m[INFO] Copy dot.tmux.conf to home directory.\e[39m"
cp dot.gtkrc-2.0 ~/.gtkrc-2.0
echo -e "\e[34m[INFO] Copy dot.gtkrc-2.0 to home directory.\e[39m"
cp dot.gtkrc.mine ~/.gtkrc.mine
echo -e "\e[34m[INFO] Copy dot.gtkrc.mine to home directory.\e[39m"

##
# to install
# python-dev, liblua, lua, perl, libperl
# mercurl
##
# Vim install(Ubuntu)

echo -e "\e[34m[INFO] Start installation of vim 7.4.\e[39m"
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
echo -e "\e[34m[INFO] Finished installation of vim 7.4.\e[39m"

# Vimの初期設定
echo -e "\e[34m[INFO] Initialize configuration of vim 7.4.\e[39m"
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -c NeoBundleInstall

# rbenv configuration
echo -e "\e[34m[INFO] Start installation of rbenv.\e[39m"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset

# Fonts Configuration
echo -e "\e[34m[INFO] Setting font configuration.\e[39m"
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
echo -e "\e[32m Do you want to install erlang? (y/n) > "
while :
do
  read select
  case $select in
    'Y' | [yY]es | "y" )
      curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
      mkdir ~/bin
      mv kerl ~/bin
      chmod a+x ~/bin/kerl
      echo 'KERL_CONFIGURE_OPTIONS="--disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll" ' > ~/.kerlrc

      ~/bin/kerl list releases 
      ~/bin/kerl update releases 
      ~/bin/kerl build 17.3 17.3
      ~/bin/kerl install 17.3 ~/erlang/17.3
      . ~/erlang/17.3/activate
      break
      ;;
    "n" | "N" | [Nn]o )
      break
      ;;
    *)
      echo -e "\e[31m[Error] Wrong input. Please y/n input.\e[39m"
      ;;
  esac
done

## Install golang
echo -e "\e[32m Do you want to install golang? (y/n) > "
while :
do
  read select
  case $select in
    'Y' | [yY]es | "y" )
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
      ;;
    "n" | "N" | [Nn]o )
      break
      ;;
    *)
      echo -e "\e[31m[Error] Wrong input. Please y/n input.\e[39m"
      ;;
  esac
done

