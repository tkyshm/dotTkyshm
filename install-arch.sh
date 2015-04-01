#!/bin/bash

yaourt -Sy mercurial git zsh

git clone https://github.com/tkyshm/dotTkyshm.git ~/dotTkyshm
cd ~/dotTkyshm

## dot files copy
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

## VIM install

