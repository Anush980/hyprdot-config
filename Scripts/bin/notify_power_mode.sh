#!/bin/bash

# Capture the current power mode
mode=$(powerprofilesctl get)

# Notify based on the current mode
if [[ $mode == "performance" ]]; then
    notify-send -t 1100 "Power Mode" "Performance mode set" --icon=dialog-information
elif [[ $mode == "power-saver" ]]; then
    notify-send -t 1100 "Power Mode" "Powersaver mode set" --icon=dialog-information
else
    notify-send -t 1100 "Power Mode" "Balanced mode set" --icon=dialog-information
fi
