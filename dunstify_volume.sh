#!/bin/bash


function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function get_mute {
    amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g'
}

volume=`get_volume`
sound=`get_mute`

msgId="235232"
appId="volume_change"

# Make the bar with the special character ─ (it's not dash -)
# https://en.wikipedia.org/wiki/Box-drawing_character
bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')

if [ $sound == "on" ]; then

    # select icon
    if (( $volume > 0 )) && (( $volume < 30 )); then
        summary="Volume $volume"
        icon="notification-audio-volume-low"
    elif (( $volume >= 30 )) && (( $volume < 70 )); then
        summary="Volume $volume"
        icon="notification-audio-volume-medium"
    elif (( $volume >= 70 )); then
        summary="Volume $volume"
        icon="notification-audio-volume-high"
    else
        summary="Mute"
        icon="notification-audio-volume-muted"
    fi

dunstify -a "$appId" -i $icon -t 1500 -r "$msgId" -u low "$summary" $bar

else
dunstify -a "$appId" -i notification-audio-volume-muted -t 1500 -r "$msgId" -u low "Mute"
fi

