#!/bin/bash
border_state=$(swaymsg -t get_tree | jq -r '.. | objects | select(.focused==true).border')

if [[ $border_state == "normal" ]]; then
    swaymsg border pixel 1
else
    swaymsg border normal
fi
