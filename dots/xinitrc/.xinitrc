#& wal -R
export TERM=st
export PATH=~/.local/bin:$PATH
setxkbmap no &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
xmodmap -e "keycode 135 = Super_L" &
ulimit -c 0
sh ~/.screenlayout/2.sh

dunst &
~/.fehbg &
picom -b &
# ~/.config/polybar/polybar_session.sh &
xrdb -merge ~/.cache/wal/colors.Xresources
if [ -z "$1" ]; then
  exec i3
else
  exec $1
fi
