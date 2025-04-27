#!/bin/bash

#        disable_while_typing = true
tmp=$(cat ~/.config/hypr/hyprland.conf | grep "disable_while")
tf=${tmp:31}

if [[ $tf == "true" ]]; then
    sed -i "s/        disable_while_typing = true/        disable_while_typing = false/" ~/.config/hypr/hyprland.conf
    notify-send "disable_while_typing" "Now deactivate"
else
    sed -i "s/        disable_while_typing = false/        disable_while_typing = true/" ~/.config/hypr/hyprland.conf
    notify-send "disable_while_typing" "Now active"
fi
