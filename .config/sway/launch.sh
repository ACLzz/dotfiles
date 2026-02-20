#!/bin/bash
export CFG_PATH=/tmp/sway_config
cat ~/.config/sway/config > $CFG_PATH

case "$1" in
	sway)
		echo "include ~/.config/sway/config.d/wayland" >> $CFG_PATH
		exec systemd-run --user --same-dir --wait sway -c $CFG_PATH
		;;
	xsway)
		echo "include ~/.config/sway/config.d/xwayland" >> $CFG_PATH
                exec systemd-run --user --same-dir --wait sway -c $CFG_PATH
                ;;
	*)
		echo "invalid session: $1"
		exec /bin/sh
		;;
esac

