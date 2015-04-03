#!/bin/bash

yaourt -Sy mercurial git zsh lua 
yaourt -Sy htop
yaourt -Sy ncmpcpp mpd weechat alsa-tools thunar
yaourt -Sy slim scrot hsetroot rxvt-unicode 
yaourt -Sy bspwm-git sxhkd-git
yaourt -Sy compton dmenu xorg-server
# You must check VIDEO CARD
# lspci | grep VGA
yaourt -S xf86-video-intel
yaourt -S xorg-server xorg-server-utils
yaourt -S xcb-util xcb-util-keysyms libxcb xcb-util-wm

# yaourt completion
yaourt -S aur-git
sudo aur

## Cloning my dotfiles.
git clone https://github.com/tkyshm/dotTkyshm.git ~/dotTkyshm
cd ~/dotTkyshm

## dot files copy.
cp dot.zshrc ~/.zshrc
cp -r dot.zsh.d ~/.zsh.d
cp dot.zshrc.mine ~/.zshrc.mine
cp dot.zshenv ~/.zshenv
cp dot.vimrc ~/.vimrc
cp -r dot.vim ~/.vim
sudo cp profiles/* /etc/zsh
cp dot.tmux.conf ~/.tmux.conf
cp dot.kerlrc ~/.kerlrc
cp -r .git_tmp ~/.git_tmp
cp dot.Xdefaults ~/.Xdefaults
cp dot.Xresources ~/.Xresources
cp dot.xinitrc ~/.xinitrc
cp dot.compton.conf ~/.compton.conf

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

## Bspwm & sxhd


## erlang install
