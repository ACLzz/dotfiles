#!/bin/bash
# prep commands
echo "Running preps..."
/usr/bin/swaymsg workspace 10 output HEADLESS-1
/usr/bin/swaymsg workspace 9 output HEADLESS-1
/usr/bin/swaymsg workspace 8 output HEADLESS-1
/usr/bin/swaymsg workspace 7 output HEADLESS-1
/usr/bin/swaymsg workspace 6 output HEADLESS-1
/usr/bin/swaymsg output HEADLESS-1 position 1920 0
/usr/bin/swaymsg output HEADLESS-1 enable

cleanup() {
  swaymsg output HEADLESS-1 disable
  swaymsg output HEADLESS-1 position 1280 -1080
  swaymsg workspace 6 output HDMI-A-1
  swaymsg workspace 7 output HDMI-A-1
  swaymsg workspace 8 output HDMI-A-1
  swaymsg workspace 9 output HDMI-A-1
  swaymsg workspace 10 output HDMI-A-1
}

trap cleanup SIGTERM SIGINT

# run server synchronous
/usr/bin/sunshine ~/.config/sunshine1/sunshine.conf

