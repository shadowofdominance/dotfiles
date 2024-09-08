#!/bin/bash

while true; do
    # Get the date and time separately
    date=$(date +"%Y-%m-%d")
    ti=$(date +"%H:%M:%S")

    # Get CPU usage
    cpu_usage=$(grep -o "^[^ ]*" /proc/loadavg)

    # Get memory usage
    memory_usage=$(free -h | awk '/^Mem/ { print $3 "/" $2 }' | sed s/i//g)

    # Get free disk space (root partition)
    disk_free=$(df -h / | awk 'NR==2 {print $4}')

    # Combine everything into one string and update the dwm bar
    xsetroot -name "󰻠 $cpu_usage | 󰍛 $memory_usage | 󰋊 $disk_free | 󰸗 $date | 󰥔 $ti | 󰍹 $(hostname)"

    # Update every 5 seconds
    sleep 5
done
