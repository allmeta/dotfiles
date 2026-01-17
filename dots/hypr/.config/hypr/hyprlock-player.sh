#!/usr/bin/env bash

playerctl status >/dev/null 2>&1 || { echo ""; exit 0; }

player=$(playerctl --list-all | head -n1)  # Prioritize first/active; change to grep firefox.* if needed
status=$(playerctl --player="$player" status 2>/dev/null || echo "Stopped")
title=$(playerctl --player="$player" metadata title 2>/dev/null | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
artist=$(playerctl --player="$player" metadata artist 2>/dev/null | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')
position=$(playerctl --player="$player" position --format '{{ duration(position) }}' 2>/dev/null || echo "00:00")
length=$(playerctl --player="$player" metadata mpris:length --format '{{ duration(mpris:length) }}' 2>/dev/null || echo "00:00")

# Status icon
case "$status" in
    Paused) icon="" ;;
    Playing)  icon="" ;;
    *)       icon="■" ;;
esac

# ASCII progress bar (20 segments)
bar=""
if [ "$length" != "00:00" ]; then
    pos_sec=$(playerctl position 2>/dev/null | awk '{printf "%.0f", $1}' || echo 0)
    len_sec=$(playerctl metadata mpris:length 2>/dev/null | awk '{printf "%.0f", $1 / 1000000}' || echo 1)
    bar_width=20
    filled=$(( (pos_sec * bar_width) / len_sec ))
    # bar=$(printf '█%.0s' $(seq 1 $filled))$(printf '░%.0s' $(seq 1 $((bar_width - filled))))
    bar=$(printf '▰%.0s' $(seq 1 $filled))$(printf '▱%.0s' $(seq 1 $((bar_width - filled))))
fi

# Line 1: current <bar> total
line1="${position} ${bar} ${length}"

# Line 2: prev play/pause next (gray icons for subtle look)
line2="       ${icon}     "

# Line 3: text only (icon + artist - title)
text_line=""
[ -n "$artist" ] && text_line="${text_line}${artist} - "
line3="${text_line}${title}"

echo "${line3}\n${line1}\n${line2}"
