
export VISUAL=vim
export TERMINAL=kitty
  if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
