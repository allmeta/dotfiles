#& wal -R
export TERM=st
export EDITOR=vim
export PATH=~/.local/bin:$PATH
setxkbmap no &
xinput set-prop 11 303 1 &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap -e "keycode 135 = Super_L" &

dunst &
~/.fehbg &
pulseaudio --start
picom -b &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
