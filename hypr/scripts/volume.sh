#!/usr/bin/bash

iDIR="$HOME/.config/mako/icons"

# Get Volume
get_volume() {
    volume=$(wpctl get-volume @DEFAULT_SINK@ | sed -e "s/\.//" | sed -e "s/Volume: 0/Volume: /")
	echo "$volume"
}

# Get icons
get_icon() {
	current=$(get_volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/volume-mute.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/low-volume.png"
	elif [[ ("$current" -ge "30") && ("$current" -le "65") ]]; then
		echo "$iDIR/medium-volume.png"
	elif [[ ("$current" -ge "60") ]]; then
		echo "$iDIR/high-volume.png"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "$(get_volume) %"
}

# Increase Volume
inc_volume() {
	wpctl set-volume @DEFAULT_SINK@ 5%+ && notify_user
}

# Decrease Volume
dec_volume() {
	wpctl set-volume @DEFAULT_SINK@ 5%- && notify_user
}

# Toggle Mute
toggle_mute() {
	if [[ "$(pamixer --get-mute)" == "false" ]]; then
		wpctl set-mute @DEFAULT_SINK@ 1 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/volume-mute.png" "Volume Switched OFF"
	elif [[ "$(pamixer --get-mute)" == "true" ]]; then
		wpctl set-mute @DEFAULT_SINK@ 0 && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume Switched ON"
	fi
}

# Toggle Mic
toggle_mic() {
	if [[ "$(pamixer --default-source --get-mute)" == "false" ]]; then
		pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Microphone Switched OFF"
	elif [[ "$(pamixer --default-source --get-mute)" == "true" ]]; then
		pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "" "Microphone Switched ON"
	fi
}
# Get icons
get_mic_icon() {
	current=$(pamixer --default-source --get-volume)
	if [[ "$current" -eq "0" ]]; then
		echo ""
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo ""
	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo ""
	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo ""
	fi
}
# Notify
notify_mic_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_mic_icon)" "Mic-Level : $(pamixer --default-source --get-volume) %"
}

# Increase MIC Volume
inc_mic_volume() {
	pamixer --default-source -i 5 && notify_mic_user
}

# Decrease MIC Volume
dec_mic_volume() {
	pamixer --default-source -d 5 && notify_mic_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
elif [[ "$1" == "--get-mic-icon" ]]; then
	get_mic_icon
elif [[ "$1" == "--mic-inc" ]]; then
	inc_mic_volume
elif [[ "$1" == "--mic-dec" ]]; then
	dec_mic_volume
else
	get_volume
fi
