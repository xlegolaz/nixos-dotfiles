#!/usr/bin/env bash 

#COLORSCHEME=doom-one

### AUTOSTART PROGRAMS ###

lxsession &
#dunst -conf "$HOME"/.config/dunst/"$COLORSCHEME" &

xrandr --output HDMI-1 --mode 1920x1080 --rate 74.97 &

#nm-applet &
#systemctl --user start mpd &
#"$HOME"/.screenlayout/layout.sh &
sleep 1
#conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conf || echo "Couldn't start conky."
#sleep 1
#yes | /usr/bin/emacs --daemon &

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to set wallpaper with 'waypaper' 
#waypaper --restore &
feh --bg-fill /home/xlegolaz/Documents/wallpapers/halo.jpg &

#wayland
#swaybg -i /home/xebec/Pictures/wallpapers/mount.jpg -m fill &

xset r rate 210 40 &
#setxkbmap us &
# 2. Uncomment to set wallpaper with 'dm-setbg' from dmscripts
# xargs xwallpaper --stretch < ~/.cache/wall &

# 3. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &

#if  [ ! -d "$HOME"/.cache/betterlockscreen/ ]; then
#    betterlockscreen -u /usr/share/backgrounds/dtos-backgrounds/0277.jpg & 
#fi
