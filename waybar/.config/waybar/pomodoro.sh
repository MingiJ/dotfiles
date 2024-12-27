#!/bin/bash
previous_line=""

waybar-module-pomodoro -w 60 -s 5 -l 15 | while read -r line; do    
    # Detect transition from work to break
    if echo "$previous_line" | grep -F 'class": "work"' && echo "$line" | grep -F 'class": ""'; then
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    fi
    
    # Store current line for next iteration
    previous_line="$line"
    
    # Pass through the waybar output
    echo "$line"
done
