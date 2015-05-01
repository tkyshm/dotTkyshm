#!/bin/bash
## vim install
hg clone https://vim.googlecode.com/hg/ ~/vim
cd ~/vim
./configure --with-features=huge \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config \
--enable-fail-if-missing \
--enable-multibyte \
--enable-perlinterp \
--enable-luainterp
make
sudo make install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -c NeoBundleInstall


