#!/bin/bash

# Get Brightness
get_brightness() {
    brightness1=$(brightnessctl g)
    declare -i brightness
    brightness=$brightness1/960
    echo "$brightness"
}

# Notify
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Яркость: $(get_brightness)%"
}

inc_brightness() {
    brightnessctl s 10%+ && notify_user
}

dec_brightness() {
    brightnessctl s 10%- && notify_user
}

if [[ "$1" == "--get" ]]; then
    get_brightness

elif [[ "$1" == "--inc" ]]; then
    inc_brightness

elif [[ "$1" == "--dec" ]]; then
    dec_brightness

fi
