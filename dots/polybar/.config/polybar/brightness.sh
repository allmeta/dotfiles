#!/bin/bash
# ugliest script holy fuck
# meme script to echo screen brightness in integer
a=$(xrandr --current --verbose | fgrep "Backlight" | grep -Eo '[0-9]{0,3}')
b=$(bc <<< "scale=2; (${a}+1)/937*100")
echo ${b%.*}