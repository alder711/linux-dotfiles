#!/bin/bash
# startup.sh

# Start all conky configs, inspired from
# https://github.com/davidrlunu/dots-and-dashes

# Conky root
ROOT_CONKY_DIR="/home/trevorbautista/.config/conky";

# Main statistics
exec /usr/bin/env conky -c $ROOT_CONKY_DIR"/conky_main_stats" &
# System logs on lower left
exec /usr/bin/env conky -c $ROOT_CONKY_DIR"/conky_loggs" &

exit 0;
