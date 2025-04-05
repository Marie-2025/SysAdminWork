#!/bin/bash

# Set RAM threshold (80%)
THRESHOLD=80

while true; do
    # Get used RAM percentage
    USED_RAM=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

    if [ "$USED_RAM" -ge "$THRESHOLD" ]; then
        # Show alert
        echo "WARNING: High RAM usage detected! Current usage: ${USED_RAM}%"
        notify-send "High RAM Usage!" "Current usage: ${USED_RAM}%"
    fi

    # Check every 10 seconds
    sleep 10
done
