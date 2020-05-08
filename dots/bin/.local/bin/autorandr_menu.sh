#!/bin/bash
ans=$(autorandr | rofi -dmenu | cut -d" " -f1) || exit
autorandr $ans
