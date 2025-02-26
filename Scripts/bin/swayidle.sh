#!/bin/bash

is_video_playing() {
    # Check if any MPRIS-compatible player (like VLC, Spotify) is playing
    if playerctl status 2>/dev/null | grep -q "Playing"; then
        return 0
    fi

    # Check if Firefox is playing a video via DBus
    if dbus-send --print-reply --dest=org.mpris.MediaPlayer2.firefox \
        /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
        string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' 2>/dev/null \
        | grep -q "Playing"; then
        return 0
    fi

    return 1
}

swayidle -w \
    timeout 2000 'is_video_playing || (swaylock && hyprctl dispatch dpms off)' \
    resume 'hyprctl dispatch dpms on'
