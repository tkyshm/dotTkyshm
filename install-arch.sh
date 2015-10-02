#!/bin/bash
echo -e "\e[32m<< Install script for ArchLinux >>\e[39m"
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
INSTALLER_DIR=$SCRIPT_DIR/installer-kits

# standard pacakges
yaourt -Sy mercurial git zsh lua 
yaourt -Sy file-roller transmission-gtk feh
yaourt -Sy ncmpcpp mpd weechat thunar
yaourt -S tcl tcllib aspell
yaourt -S sound-theme-freedesktop 
yaourt -Sy scrot hsetroot rxvt-unicode dzen2 conky
yaourt -Sy bspwm-git sxhkd-git
yaourt -Sy compton dmenu xorg-server unclutter xcalib
yaourt -S tint2 xdotool vnstat docky mpc mpd 
yaourt -S smc pm
yaourt -S otf-ipaexfont
# for conky panel
yaourt -S acpi bc
# You must check VIDEO CARD
# lspci | grep VGA
yaourt -S xf86-video-intel
yaourt -S xorg-server xorg-server-utils xorg-utils
yaourt -S xcb-util xcb-util-keysyms libxcb xcb-util-wm
# Input method
yaourt -S fcitx-im fcitx-mozc fcitx-configtool fcitx-qt4 fcitx-gtk2
# font
yaourt -S fontforge-git
# performance tool 
yaourt -S wget htop lsof net-tools iotop sysstat iftop nmon
yaourt -S tcpdump 
# Numix theme
yaourt -S numix-circle-icon-theme-git numix-themes-git
yaourt -S gtk-chtheme gtk-theme-switch2 gtk2_prefs
# other applications
yaourt -S zathura terminator ranger
# Sound packages
sudo pacman -S alsa-utils asoundconf
sudo pacman -S pulseaudio pulseaudio-alsa paprefs pavucontrol

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
cp dot.gtkrc.mine ~/.gtkrc.mine
cp dot.gtkrc-2.0 ~/.gtkrc-2.0
cp -ru dot.config/bspwm ~/.config/
cp -ru dot.config/sxhkd ~/.config/
# background
mkdir -p ~/Pictures
wget http://feelgrafix.com/data_images/out/16/907950-triangle-wallpaper.jpg bg001.jpg
mv 907950-triangle-wallpaper.jpg bg001.jpg
mv bg001.jpg ~/Pictures/

# Fonts Configuration
$INSTALLER_DIR/fonts-installer.sh $INSTALLER_DIR
## Install software 
$INSTALLER_DIR/vim-installer.sh
$INSTALLER_DIR/erlang-insteller.sh
$INSTALLER_DIR/golang-installer.sh
$INSTALLER_DIR/rust-installer.sh
$INSTALLER_DIR/rbenv-installer.sh
## Bspwm & sxhd


## erlang install
