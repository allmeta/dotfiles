#& wal -R
export TERM=st
export EDITOR=vim
export PATH=~/.local/bin:$PATH
setxkbmap no &
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
ulimit -c 0 &
xset m 0 0 &

dunst &
~/.fehbg &
picom -b &
xrdb -merge ~/.cache/wal/colors.Xresources
exec ${1:-i3}
