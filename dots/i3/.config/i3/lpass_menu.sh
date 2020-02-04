#!/bin/bash

[[ $(lpass ls) ]] || [[ $(lpass login $(cat ~/.email)) ]] || exit 1
item=`lpass ls | awk -F '[/[]' '{print $(NF-1)}' | rofi -dmenu -i -p 'Select item'` || exit 1
lpass show -c --password $item
notify-send "$item" "Password copied"
