#!/bin/bash

ids=[]

niri msg -j event-stream | jq --unbuffered -r ". | select ( . | has(\"WindowOpenedOrChanged\")) | .[\"WindowOpenedOrChanged\"].window | select((.title? | match(\"Extension: .* (Mozilla Firefox|Zen Browser|LibreWolf)\")) and .is_floating == false) | .id" | while read id; do
    if [[ "${ids[*]}" == *"$id"* ]]; then
        continue
    fi

    ids+="$id"
    niri msg action toggle-window-floating --id="$id"
    niri msg action set-window-height 50%
    niri msg action set-window-width 20%
    niri msg action center-window --id="$id"

    # center-window handles vertical, but leaves floating windows' horizontal
    # position alone. Window width is 20% of the output, so center it at x=40%.
    width=$(niri msg -j focused-output | jq -r '.logical.width')
    x=$(( width * 2 / 5 ))
    niri msg action move-floating-window --id="$id" -x "$x"
done
