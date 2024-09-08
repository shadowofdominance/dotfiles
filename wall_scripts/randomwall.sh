#!/bin/bash

WALL_SCRIPTS=(
	"/pathtoyour_script/feelheaven.sh"
	"/pathtoyour_script/reachfuture.sh"
	"/pathtoyour_script/hellstart.sh"
	"/pathtoyour_script/architect.sh"
	"/pathtoyour_script/spaceout.sh"
	"/pathtoyour_script/cars.sh"
)

RAN_INDEX=$((RANDOM % ${#WALL_SCRIPTS[@]}))

"${WALL_SCRIPTS[RAN_INDEX]}"
