#!/usr/bin/sh
#
# This script locks the screen by pixelating the background and locking.


# COLORS
DARK_OPAQUE='#00000080'
LIGHT_OPAQUE='#00ffff22'
CYAN='#00ffffff'
DARK_GREY='#3c3c3cff'
MEDIUM_BLUE='#174295ff'

# Placeholder for final image
BACKGROUND_IMAGE='/tmp/screen.png'
# location of overlayed lock image
LOCK_IMAGE='/home/trevorbautista/.config/i3/lock.png'


# get background image
scrot /tmp/screen.png
# blur image
convert $BACKGROUND_IMAGE -scale 10% -scale 1000% $BACKGROUND_IMAGE
# pixelate image
[[ -f $1 ]] && convert $BACKGROUND_IMAGE $1 -gravity center -composite -matte $BACKGROUND_IMAGE
# overlap lock image with pixelated image
composite -gravity center $LOCK_IMAGE $BACKGROUND_IMAGE $BACKGROUND_IMAGE
#convert /tmp/screen.png -gravity center -matte /tmp/screen.png

# lock screen
/bin/i3lock -k -i /tmp/screen.png \
	--insidevercolor=$LIGHT_OPAQUE \
	--ringvercolor=$DARK_OPAQUE \
	--insidewrongcolor=$LIGHT_OPAQUE \
	--timecolor=$MEDIUM_BLUE \
	--datecolor=$MEDIUM_BLUE \
	--datestr="%A, %B %d, %Y"
