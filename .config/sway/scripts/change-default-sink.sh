#!/bin/bash
# $1 is a sink description
ID=$(wpctl status | grep "\. $1" | egrep '^ │( )*[0-9]*' -o | cut -c6-55 | egrep -o '[0-9]*');
wpctl set-default $ID

