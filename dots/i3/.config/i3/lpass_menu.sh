#!/bin/bash

if [[ "$(lpass ls)" == "" ]]; then
	# not logged in
	ans=$(lpass login $(cat ~/.email))
	[[ "$ans" == "" ]] && exit 1
fi

item=`lpass ls | awk -F '[/[]' '{print $(NF-1)}' | rofi -dmenu -i -p 'Select item'`

if [ $item ]; then
		lpass show -c --password $item
		notify-send "$item" "Password copied"
fi
