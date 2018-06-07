#!/bin/sh

# compositor
compton

# bg

feh --image-bg /home/ad/Pictures/Wallpaper_Mikael_Gustafsson_preview.png --bg-fill

# keys
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'
