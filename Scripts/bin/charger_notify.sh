#!/bin/bash

# Initial state
PREVIOUS_STATE=""

while true; do
    # Check the charging state
    CURRENT_STATE=$(cat /sys/class/power_supply/AC/online)

    if [[ "$CURRENT_STATE" != "$PREVIOUS_STATE" ]]; then
        if [[ "$CURRENT_STATE" == "1" ]]; then
            notify-send -i battery-full-charged "Charger Connected" "Your charger is now plugged in."
        else
            notify-send -i battery-caution "Charger Disconnected" "Your charger has been removed."
        fi
        PREVIOUS_STATE=$CURRENT_STATE
    fi

    # Sleep for a short duration
    sleep 2
done
