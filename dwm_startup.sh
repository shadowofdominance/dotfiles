#!/bin/bash

exec /home/shadowg_2004/scripts/reachfuture.sh &

sleep 2

compton &

exec /home/shadowg_2004/status_bar.sh &

exec dwm
