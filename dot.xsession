#!/usr/bin/zsh
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
DEFAULT_SESSION=i3

# input and output setting
xset +fp ~/.fonts
xset fp rehash
xset r rate 200 30

#wmname LG3D
#xcalib $HOME/x230.icm &

xmodmap ~/.Xmodmap

xsetroot -cursor_name left_ptr
# xrandr --output eDP1 --mode 1920x1200
# xrandr --output HDMI2 --above eDP1 --mode 1920x1080
# xrandr --output DP-1 --mode 2560x1080
# xrandr --output eDP-1 --mode 1920x1080 --same-as DP-1 --scale 1.333x1

# Background and compton
#bgnum=$((1 + RANDOM % 10))
feh --bg-fill --no-xinerama $HOME/Pictures/bg.jpg
# compton &

# start daemon
unclutter -grab -noevents -root & # mouse event
fcitx -d                          # input method
pulseaudio --start                # sound envrionment

#exec i3 >> $HOME/.config/i3/i3log-$(date +'%Y%m%d') 2>&1 ;;
