#!/usr/bin/env bash
#
# This script locks the screen by pixelating the background and locking.


# COLORS
DARK_OPAQUE='#00000080'
LIGHT_OPAQUE='#00ffff22'
CYAN='#00ffffff'
DARK_GREY='#3c3c3cff'
MEDIUM_BLUE='#174295ff'

# Lock image location
LOCK_IMG='/home/trevorbautista/.config/i3/lock.png'


# get background image
scrot /tmp/screen.png
# blur image
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
# pixelate image
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#convert /tmp/screen.png -gravity center -matte /tmp/screen.png

# put lock image on top
composite -gravity center $LOCK_IMG /tmp/screen.png /tmp/screen.png

# lock screen
/usr/bin/env i3lock -k -i /tmp/screen.png \
	--insidevercolor=$LIGHT_OPAQUE \
	--ringvercolor=$DARK_OPAQUE \
	--insidewrongcolor=$LIGHT_OPAQUE \
	--timecolor=$MEDIUM_BLUE \
	--datecolor=$MEDIUM_BLUE \
	--datestr="%A, %B %d, %Y"
