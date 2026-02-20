#!/bin/bash
PID=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).pid');

NAME=$(wpctl status | grep "pid:$PID" | awk '{print $2}');
STREAM_ID=$(wpctl status | grep "\. $NAME" | tail -n 1 | egrep '^ ( )*[0-9]*' -o | cut -c6-55 | egrep -o '[0-9]*');
if [ -z "$NAME" ]; then
	exit 0;
fi

echo $NAME
wpctl set-mute $STREAM_ID toggle

