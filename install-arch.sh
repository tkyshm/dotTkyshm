#!/bin/bash
xset -e
echo -e "\e[32m<< Install script for ArchLinux >>\e[39m"
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
INSTALLER_DIR=$SCRIPT_DIR/installer-kits

# standard pacakges
sudo pacman -S --noconfirm ag openssh
sudo pacman -S --noconfirm xsel xclip neovim
sudo pacman -S --noconfirm i3-wm i3status

## for polybar-giy
sudo pacman -S --noconfirm cmake boost xcb-util xcb-util-wm xcb-util-image libxft
sudo pacman -S --noconfirm jsoncpp wireless_tools alsa-lib libmpdclient
sudo pacman -S --noconfirm bdf-unifont
sudo pacman -S --noconfirm xorg-xfd
yay -S --noconfirm siji-git # iconic font
yay -S --noconfirm polybar-git

yay -Sy --noconfirm mercurial git zsh lua
yay -Sy --noconfirm file-roller transmission-gtk feh
yay -Sy --noconfirm ncmpcpp mpd weechat thunar
yay -S --noconfirm tcl tcllib aspell
yay -S --noconfirm sound-theme-freedesktop
yay -Sy --noconfirm scrot feh dzen2 conky
yay -Sy --noconfirm sxhkd-git
yay -Sy --noconfirm compton dmenu xorg-server xorg-xinit unclutter xcalib slim
yay -S --noconfirm tint2 xdotool vnstat docky mpc mpd
yay -S --noconfirm smc pm
yay -S --noconfirm otf-ipaexfont
sudo pacman -S --noconfirm gmrun dunst

# for conky panel
yay -S --noconfirm acpi bc

# You must check VIDEO CARD
# lspci | grep VGA
yay -S --noconfirm xf86-video-intel
yay -S --noconfirm xorg-server-utils xorg-utils
yay -S --noconfirm xcb-util xcb-util-keysyms libxcb xcb-util-wm

# Input method
yay -S --noconfirm fcitx-im fcitx-mozc fcitx-configtool fcitx-qt4 fcitx-gtk2

# font
yay -S --noconfirm fontforge-git
yay -S --noconfirm otf-inconsolata-dz-powerline

# performance tool
yay -S --noconfirm wget htop lsof net-tools iotop sysstat iftop nmon
yay -S --noconfirm tcpdump

# Numix theme
yay -S --noconfirm numix-circle-icon-theme-git numix-themes-git
yay -S --noconfirm gtk-chtheme gtk-theme-switch2 gtk2_prefs

# other applications
yay -S --noconfirm zathura terminte ranger rofi
# terminal emulator
yay -S --noconfirm terminix gtkd termite-git
sudo pacman -S --noconfirm xorg-xrdb

# Sound packages
sudo pacman -S --noconfirm alsa-utils asoundconf
sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa paprefs pavucontrol

# neovim python plugin
sudo pacman -S --noconfirm neovim

# lemonbar install
#git clone https://github.com/LemonBoy/bar.git ~/bar
#cd ~/bar
#make
#sudo cp lemonbar /usr/local/bin
#rm -rf ~/bar
#cd $SCRIPT_DIR

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
ln -s $SCRIPT_DIR/dot.config/bspwm $HOME/.config/bspwm
ln -s $SCRIPT_DIR/dot.config/sxhkd ~/.config/sxhkd
ln -s $SCRIPT_DIR/dot.config/nvim ~/.config/nvim
ln -s $SCRIPT_DIR/dot.config/peco ~/.config/peco
ln -s $SCRIPT_DIR/dot.config/i3 ~/.config/i3
ln -s $SCRIPT_DIR/dot.config/gtk-3.0 ~/.config/gtk-3.0
ln -s $SCRIPT_DIR/dot.config/polybar ~/.config/polybar
ln -s $SCRIPT_DIR/dot.gitconfig $HOME/.gitconfig

# background
mkdir -p ~/Pictures
wget http://feelgrafix.com/data_images/out/16/907950-triangle-wallpaper.jpg bg001.jpg
mv 907950-triangle-wallpaper.jpg bg001.jpg
mv bg001.jpg ~/Pictures/

# Fonts Configuration
$INSTALLER_DIR/fonts-installer.sh $INSTALLER_DIR

## Install software
#$INSTALLER_DIR/vim-installer.sh
#$INSTALLER_DIR/rbenv-installer.sh
#mkdir ~/.erlenv/
#cp ./erlenv/configure_opts $SCRIPT_DIR/.erlenv/

## install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
