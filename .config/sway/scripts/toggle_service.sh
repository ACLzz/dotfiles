#!/bin/bash
SERVICE=$1
STATUS=`systemctl --user status $SERVICE | grep "Active: " | awk '{print $2}'`

if [[ $STATUS == 'active' ]]; then
	systemctl --user stop $SERVICE
elif [[ $STATUS == 'inactive' ]]; then
	systemctl --user start $SERVICE
fi
