#!/bin/bash
# startup.sh

# Start all conky configs, inspired from
# https://github.com/davidrlunu/dots-and-dashes

# Conky root
ROOT_CONKY_DIR="/home/trevor/.config/conky";

sleep 10

if pgrep -x "conky" > /dev/null; then
	echo "Conky Already running for XFCE, reloading..."
	pkill conky
	exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_main_stats_xfce"
else
	echo "No conky running for XFCE, starting..."
	exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_main_stats_xfce"
fi

exit 0;
