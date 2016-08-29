#!/bin/bash
echo -e "\e[32m<< Install script for ArchLinux >>\e[39m"
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
INSTALLER_DIR=$SCRIPT_DIR/installer-kits

# standard pacakges
sudo pacman -S --noconfirm ag openssh
sudo pacman -S --noconfirm xsel xclip neovim
yaourt -Sy --noconfirm mercurial git zsh lua
yaourt -Sy --noconfirm file-roller transmission-gtk feh
yaourt -Sy --noconfirm ncmpcpp mpd weechat thunar
yaourt -S --noconfirm tcl tcllib aspell
yaourt -S --noconfirm sound-theme-freedesktop
yaourt -Sy --noconfirm scrot feh dzen2 conky
yaourt -Sy --noconfirm bspwm-git sxhkd-git
yaourt -Sy --noconfirm compton dmenu xorg-server unclutter xcalib
yaourt -S --noconfirm tint2 xdotool vnstat docky mpc mpd
yaourt -S --noconfirm smc pm
yaourt -S --noconfirm otf-ipaexfont
sudo pacman -S --noconfirm gmrun dunst
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
yaourt -S --noconfirm otf-inconsolata-dz-powerline
# performance tool
yaourt -S --noconfirm wget htop lsof net-tools iotop sysstat iftop nmon
yaourt -S --noconfirm tcpdump
# Numix theme
yaourt -S --noconfirm numix-circle-icon-theme-git numix-themes-git
yaourt -S --noconfirm gtk-chtheme gtk-theme-switch2 gtk2_prefs
# other applications
yaourt -S --noconfirm zathura terminator ranger
# terminal emulator
yaourt -S --noconfirm terminix gtkd rxvt-unicode
sudo pacman -S --noconfirm xorg-xrdb urxvt-perls
# Sound packages
sudo pacman -S --noconfirm alsa-utils asoundconf
sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa paprefs pavucontrol

# neovim python plugin 
sudo pip3 install neovim

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

## Prezto install
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
cp zprezto/* ~/.zprezto/runcoms  # move my setting files
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md\(.N\); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

## Install dot files.
sudo cp profiles/* /etc/zsh
cp dot.xinitrc ~/.xinitrc
ln -s $SCRIPT_DIR/zprezto/zpreztorc $HOME/.zprezto/runcoms/zpreztorc
ln -s $SCRIPT_DIR/dot.vimrc $HOME/.vimrc
ln -s $SCRIPT_DIR/dot.vim $HOME/.vim
ln -s $SCRIPT_DIR/dot.tmux.conf $HOME/.tmux.conf
ln -s $SCRIPT_DIR/dot.kerlrc $HOME/.kerlrc
ln -s $SCRIPT_DIR/dot.git_tmp $HOME/.git_tmp
ln -s $SCRIPT_DIR/dot.Xdefaults $HOME/.Xdefaults
ln -s $SCRIPT_DIR/dot.Xresources $HOME/.Xresources
ln -s $SCRIPT_DIR/dot.compton.conf $HOME/.compton.conf
ln -s $SCRIPT_DIR/dot.gtkrc.mine $HOME/.gtkrc.mine
ln -s $SCRIPT_DIR/dot.gtkrc-2.0 $HOME/.gtkrc-2.0
ln -s $SCRIPT_DIR/dot.config/bspwm $HOME/.config/bspwm
ln -s $SCRIPT_DIR/dot.config/sxhkd ~/.config/sxhkd
ln -s $SCRIPT_DIR/dot.config/nvim ~/.config/nvim
ln -s $SCRIPT_DIR/dot.config/peco ~/.config/peco
ln -s $SCRIPT_DIR/dot.gitconfig $HOME/.gitconfig

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

## install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
