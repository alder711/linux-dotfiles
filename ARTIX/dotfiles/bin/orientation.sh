#!/usr/bin/env bash

STYLUS="Wacom ISDv4 E6 Pen stylus"
FINGER="Wacom ISDv4 E6 Finger touch"
ERASER="Wacom ISDv4 E6 Pen eraser"

case "$1" in

	"up") 
		/usr/bin/xrandr -o 0 && \
		/usr/bin/xsetwacom set "$STYLUS" Rotate none && \
		/usr/bin/xsetwacom set "$FINGER" Rotate none && \
		/usr/bin/xsetwacom set "$ERASER" Rotate none
		;;

	"left") 
		/usr/bin/xrandr -o 1 && \
		/usr/bin/xsetwacom set "$STYLUS" Rotate ccw && \
		/usr/bin/xsetwacom set "$FINGER" Rotate ccw && \
		/usr/bin/xsetwacom set "$ERASER" Rotate ccw
		;;

	"right") 
		/usr/bin/xrandr -o 3 && \
		/usr/bin/xsetwacom set "$STYLUS" Rotate cw && \
		/usr/bin/xsetwacom set "$FINGER" Rotate cw && \
		/usr/bin/xsetwacom set "$ERASER" Rotate cw
		;;

	"down") 
		/usr/bin/xrandr -o 2 && \
		/usr/bin/xsetwacom set "$STYLUS" Rotate half && \
		/usr/bin/xsetwacom set "$FINGER" Rotate half && \
		/usr/bin/xsetwacom set "$ERASER" Rotate half
esac
