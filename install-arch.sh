#!/bin/bash
echo -e "\e[32m<< Install script for ArchLinux >>\e[39m"
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
INSTALLER_DIR=$SCRIPT_DIR/installer-kits

# standard pacakges
sudo pacman -S --noconfirm ag openssh
yaourt -Sy --noconfirm mercurial git zsh lua 
yaourt -Sy --noconfirm file-roller transmission-gtk feh
yaourt -Sy --noconfirm ncmpcpp mpd weechat thunar
yaourt -S --noconfirm tcl tcllib aspell
yaourt -S --noconfirm sound-theme-freedesktop 
yaourt -Sy --noconfirm scrot feh rxvt-unicode dzen2 conky
yaourt -Sy --noconfirm bspwm-git sxhkd-git
yaourt -Sy --noconfirm compton dmenu xorg-server unclutter xcalib
yaourt -S --noconfirm tint2 xdotool vnstat docky mpc mpd 
yaourt -S --noconfirm smc pm
yaourt -S --noconfirm otf-ipaexfont
# for conky panel
yaourt -S --noconfirm acpi bc
# You must check VIDEO CARD
# lspci | grep VGA
yaourt -S --noconfirm xf86-video-intel
yaourt -S --noconfirm xorg-server xorg-server-utils xorg-utils
yaourt -S --noconfirm xcb-util xcb-util-keysyms libxcb xcb-util-wm
# Input method
yaourt -S --noconfirm fcitx-im fcitx-mozc fcitx-configtool fcitx-qt4 fcitx-gtk2
# font
yaourt -S --noconfirm fontforge-git
# performance tool 
yaourt -S --noconfirm wget htop lsof net-tools iotop sysstat iftop nmon
yaourt -S --noconfirm tcpdump 
# Numix theme
yaourt -S --noconfirm numix-circle-icon-theme-git numix-themes-git
yaourt -S --noconfirm gtk-chtheme gtk-theme-switch2 gtk2_prefs
# other applications
yaourt -S --noconfirm zathura terminator ranger
# Sound packages
sudo pacman -S --noconfirm alsa-utils asoundconf
sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa paprefs pavucontrol

# lemonbar install
git clone https://github.com/LemonBoy/bar.git ~/bar
cd ~/bar
make
sudo cp lemonbar /usr/local/bin
rm -rf ~/bar
cd $SCRIPT_DIR

# yaourt completion
echo -e "Now, install aur-git for auto completion package name on zsh."
echo -n -e "But, the install require so many time. Are you ok? (y/n): "
read install_ok
if [ "$install_ok" = "y" ] ; then
  yaourt -S aur-git
  sudo aur
fi

## Cloning my dotfiles.
mkdir -p $HOME/bin
git clone https://github.com/tkyshm/dotTkyshm.git ~/dotTkyshm
cd ~/dotTkyshm

## Oh my zsh install
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

## dot files copy.
cp oh-my-zsh/dot.zshrc.mine ~/.zshrc.mine
cp oh-my-zsh/dot.zshrc ~/.zshrc 
cp oh-my-zsh/custom/tkyshm.zsh-theme ~/.oh-my-zsh/custom/tkyshm.zsh-theme 
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
cp dot.gtkrc.mine ~/.gtkrc.mine

# executable shellscript
cp bin/* $HOME/bin

# background
mkdir -p ~/Pictures
wget http://feelgrafix.com/data_images/out/16/907950-triangle-wallpaper.jpg bg001.jpg
mv 907950-triangle-wallpaper.jpg bg001.jpg
mv bg001.jpg ~/Pictures/

# Fonts Configuration
$INSTALLER_DIR/fonts-installer.sh $SCRIPT_DIR
## Install software 
$INSTALLER_DIR/vim-installer.sh
$INSTALLER_DIR/erlang-insteller.sh
$INSTALLER_DIR/golang-installer.sh
$INSTALLER_DIR/rust-installer.sh
$INSTALLER_DIR/rbenv-installer.sh
## Bspwm & sxhd


## erlang install
