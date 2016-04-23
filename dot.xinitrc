#!/usr/bin/zsh
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
DEFAULT_SESSION=bspwm

export BSPWM_SHOW_BATTERY=1

# setting urxvt 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# input and output setting
xset +fp ~/.fonts
xset fp rehash 

wmname LG3D
xcalib $HOME/x230.icm &

xmodmap ~/.Xmodmap

xcalib $HOME/x230.icm &
xsetroot -cursor_name left_ptr
xrandr --output eDP1 --mode 1920x1200
xrandr --output HDMI2 --above eDP1 --mode 1920x1080

# Background and compton
bgnum=$((1 + RANDOM % 10))
feh --bg-fill --no-xinerama $HOME/Pictures/bg${bgnum}.jpg
compton &

# screen saver
/usr/bin/xscreensaver -no-splash &

# start daemon
unclutter -grab -noevents -root & # mouse event
fcitx -d                          # input method
pulseaudio --start                # sound envrionment
sxhkd &                           # keybind for bspwm

# urxvt daemon 
urxvtd -q -f -o

## SSH Agents
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa_work 
ssh-add ~/.ssh/id_rsa_tkyshm

case "$1" in
  "bspwm" ) exec $1 -c $HOME/.config/bspwm/bspwmrc ;;
  * ) exec bspwm -c $HOME/.config/bspwm/bspwmrc ;;
esac
