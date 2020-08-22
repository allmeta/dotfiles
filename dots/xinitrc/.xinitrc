#& wal -R
export TERM=st
export PATH=~/.local/bin:$PATH
setxkbmap no &
xinput set-prop 11 303 1 &
# xinput set-prop 11 313 0 &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap -e "keycode 135 = Super_L" &

dunst &
~/.fehbg &
picom -b &
# ~/.config/polybar/polybar_session.sh &
pulseaudio -D
xrdb -merge ~/.cache/wal/colors.Xresources
exec i3
