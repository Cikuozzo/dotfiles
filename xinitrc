eval $(dbus-launch --sh-syntax --exit-with-session)
xinput set-prop "Kingsis Corporation ZOWIE Gaming mouse" "libinput Accel Profile Enabled" 0, 1
xset s off
xset -dpms
xset s noblank
setxkbmap us -variant intl
pipewire &
pipewire-pulse &
wireplumber &
lxpolkit &
feh --bg-fill ~/Immagini/wallpaper/minimal_lightbulb.jpg &


#DWM

#dwmblocks &
#exec dwm

# i3

exec i3
