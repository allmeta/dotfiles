#!/bin/sh
export TERM=st
export EDITOR=nvim
export PATH=~/.local/bin:$PATH
export QT_QPA_PLATFORMTHEME=qt5ct
xinput set-prop 11 309 1 & # enable touchpad
setxkbmap us &
setxkbmap -option ctrl:nocaps
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap -e "keycode 135 = Super_L" &

dunst &
~/.fehbg &
pipewire &
node ~/git/startpage/index.js &
# picom -b &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
