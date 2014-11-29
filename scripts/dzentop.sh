x_width=`xdpyinfo | grep dimensions | awk '{print $2}' | awk -F "x" '{print $1}'`
x_height=`xdpyinfo | grep dimensions | awk '{print $2}' | awk -F "x" '{print $1}'`
#conky -c ~/scripts/dzenconky | dzen2 -p -w 950 -x 330 -bg "#101010" -fg "#0f0f0f" -h 22 -fn "M+ 1m-8" -ta r -e 'button3='
conky -c ~/scripts/dzenconky | dzen2 -p -w $x_width -x 790 -bg "#101010" -fg "#0f0f0f" -h 22 -fn "M+ 1m-8" -ta r -e 'button3='
