#!/bin/sh
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
DEFAULT_SESSION=bspwm

#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#
## merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
#
#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi
#
#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi
##xset +fp $HOME/.fonts
##xset +fp /usr/share/fonts/local
##xset fp rehash

# start some nice programs
xrdb ~/.Xresources 
xset +fp ~/.fonts
xset fp rehash 
wmname LG3D
xcalib $HOME/x230.icm &

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
#case "$1" in
# "bspwm") 
#    sxhkd
#    exec $1
#    ;;
#esac
xcalib $HOME/x230.icm &
xsetroot -cursor_name left_ptr
#xrandr --output HDMI1 --right-of HDMI2 --mode 1920x1080
xrandr --output DP1 --right-of HDMI2 --mode 1920x1080
unclutter -grab -noevents -root &

if [[ "`acpi -b | awk '{gsub(/,/,""); print $3}'`" != "Discharging" ]] ; then
  #hsetroot -fill $HOME/Pictures/bg001.jpg &
  bgnum=$((1 + RANDOM % 13))
  feh --bg-fill --no-xinerama $HOME/Pictures/bg${bgnum}.jpg
  compton &
  #$HOME/scripts/docky-launch &
fi

#urxvt &
terminator &
fcitx -d
pulseaudio --start
sxhkd &
mpd
case "$1" in
  "bspwm" ) exec $1 -c $HOME/.config/bspwm/bspwmrc ;;
  * ) exec bspwm -c $HOME/.config/bspwm/bspwmrc ;;
esac
