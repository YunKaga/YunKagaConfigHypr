#!/bin/bash

tmp=$(cat ~/.config/hypr/UserConfig/touchpad.conf | grep "enabled")
tf=${tmp:14}

on() {
    sed -i "s/enabled = false/enabled = true/" ~/.config/hypr/UserConfig/touchpad.conf
    notify-send "touchpad" "Enable"
}

off() {
    sed -i "s/enabled = true/enabled = false/" ~/.config/hypr/UserConfig/touchpad.conf
    notify-send "touchpad" "Disabled"
}


if [[ "$tf" == "true" ]]; then
    off

elif [[ "$tf" == "false" ]]; then
    on

fi
