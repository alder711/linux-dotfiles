#!/usr/bin/env bash

STYLUS="Wacom ISDv4 E6 Pen stylus"

case "$1" in

	"up") /usr/bin/xrandr -o 0 && /usr/bin/xsetwacom set "$STYLUS" Rotate none
		;;

	"left") /usr/bin/xrandr -o 1 && /usr/bin/xsetwacom set "$STYLUS" Rotate ccw
		;;

	"right") /usr/bin/xrandr -o 3 && /usr/bin/xsetwacom set "$STYLUS" Rotate cw
		;;

	"down") /usr/bin/xrandr -o 2 && /usr/bin/xsetwacom set "$STYLUS" Rotate half
esac
