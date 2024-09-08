#!/bin/bash
WALL_DIR="/path_to_your_wallpaper_directory" #Directory for your future theme

WALLPAPERS=("$WALL_DIR"/*)

RAN_WALL="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

xwallpaper --zoom "$RAN_WALL"

wal -i "$RAN_WALL"
