#!/bin/bash

# Notify all users before logout
wall "System maintenance: You will be logged out in 1 minute. Save your work!"

# Wait for 1 minute before logout
sleep 60

# Log out all active users (excluding root)
who | awk '{print $1}' | grep -v 'root' | sort -u | while read user; do
    pkill -KILL -u "$user"
done

# Confirm logout in logs
echo "Users logged out at $(date)" >> /var/log/logout_script.log
