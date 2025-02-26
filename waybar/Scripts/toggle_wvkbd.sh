#!/bin/bash

# Check if wvkbd is running
if pgrep -x "wvkbd-mobintl" > /dev/null; then
    # If running, kill the process
    pkill -x "wvkbd-mobintl"
else
    # If not running, start wvkbd
    wvkbd-mobintl -L 160 &
fi

