#!/bin/bash

list="$(lpass ls)"

if [[ "$list" == "" ]]; then
	notify-send "lpass" "not logged in"
else
	item=`lpass ls | awk -F '[/[]' '{print $(NF-1)}' | rofi -dmenu -i -p 'Select item'`

	if [ $item ]; then
		lpass show -c --password $item
		notify-send "$item" "Password copied"
	fi
fi



