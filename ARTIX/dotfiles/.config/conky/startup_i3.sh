#!/bin/bash
# startup.sh

# Start all conky configs, inspired from
# https://github.com/davidrlunu/dots-and-dashes

# Conky root
ROOT_CONKY_DIR="/home/trevor/.config/conky";

# Network connections on upper left
exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_connections" &
# Radial peg decorations surrounding center gif
exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_radial_pegs" &
# System logs on lower left
exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_loggs" &
# Radial statistics
exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_sensors" &
# Main statistics
exec /usr/bin/conky -c $ROOT_CONKY_DIR"/conky_main_stats" &


exit 0;
