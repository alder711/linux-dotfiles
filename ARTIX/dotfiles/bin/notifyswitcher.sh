#!/usr/bin/env bash

# AUTHOR: 	Trevor Bautista
# VERSION:	0.2 as of 26 September 2018
# DESCRIPTION:	This script is basically a mediator between
#		xfce4-notifyd and dunst. The xfce4-notifyd 
#		hogs the dbus so that dunst cannot use it,
#		so this script allows the [temporary] removal
#		of the xfce4-notifyd dbus configuration (which is
#		stored in this file for future restoration), and the
#		stopping of the xfce4-notifyd process so dunst takes
#		over. 
#
###########################################################################


#if [[ "$1" == "dunst" ]]; then
#	echo "Using dunst";
#elif [[ "$1" == "xfce" ]]; then
#	echo "Using xfce";
#else
#	echo "Error";
#fi


DUNST_ARGS=""


function switch_to_dunst()
{
	DUNST_EXE=$(command -v dunst)
	if [[ "$DUNST_EXE" == "" ]]; then
		echo "[E] No executable! Stopping...";
	else
		echo "[I] Switching to dunst...";
	
		# If XFCE config for dbus does not exist,
		if ! [ -e /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service ]; then
			echo "[E] No XFCE config for dbus! Stopping...";
		# If XFCE dbus config exists,
		else
			# If empty storage location for file contents,
			if [[ "$(awk -v n=4 '/XFCE_CONFIG:/ && !--n {getline; getline; print; exit}' $0)" == "XFCE_CONFIG:" ]]; then
				echo "[I] Empty storage location in file";
				echo "[I] Appending config to file...";
				# Store XFCE config at end of this file
				cat /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service >> $0;
				echo "[I] Removing XFCE dbus config file...";
				# Remove dbus XFCE config
				rm /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service;
				echo "[I] Killing xfce4-notifyd process...";
				# Kill XFCE notify process
				pkill xfce4-notifyd;
				# Start dunst
				echo "[I] Starting dunst...";
				dunst $DUNST_ARGS;
				echo "[I] Switched to dunst: Done!";
			# If non-empty storage location for file contents,
			else
				echo "[E] Non-empty storage location in file! Stopping...";
			fi
		fi
	fi
}



function switch_to_xfce()
{
	if ! [ -e /usr/lib/xfce4/notifyd/xfce4-notifyd ]; then
		echo "[E] No executable! Stopping...";
	else
		echo "[I] Switching to xfce4-notifyd...";
		# If non-empty storage location for file contents,
		if ! [[ "$(awk -v n=4 '/XFCE_CONFIG:/ && !--n {getline; getline; print; exit}' $0)" == "XFCE_CONFIG:" ]]; then
			# If XFCE config for dbus does not exist,
			if ! [ -e /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service ]; then
				echo "[I] Tracking locaton of file to restore config from..."
				# Find the location in this file to get config from
				XFCE_payload_offset=$(($(grep -na -m1 "^XFCE_CONFIG:$" $0|cut -d':' -f1) + 1));
				echo "[I] Pushing found config to XFCE dbus config file..."
				# Push config to file
				( tail -n +$XFCE_payload_offset $0 > /usr/share/dbus-1/services/org.xfce.xfce4-notifyd.Notifications.service ) && \
				echo "[I] Removing old config informaton from file..." && \
				# Remove config
				head -$(($XFCE_payload_offset-1)) $0 > $0.tmp && \
				mv $0.tmp $0 && \
				chmod a+x $0;
				echo "[I] Killing dunst...";
				# Attempt to kill dunst
				pkill dunst;
				echo "[I] Starting the xfce4-notifyd process...";
				# Attempt to start the xfce4-notifyd process
				/usr/lib/xfce4/notifyd/xfce4-notifyd &
				echo "[I] Switched to xfce4-notifyd: done!";
			# If XFCE dbus config exists,
			else
				echo "[E] XFCE config already exists for dbus! Stopping...";
			fi
		else
			echo "[E] Empty storage location in file! Stopping...";
		fi
	fi
}





if [[ "$1" == "dunst" ]]; then
	echo "Using dunst";
	switch_to_dunst;
elif [[ "$1" == "xfce" ]]; then
	echo "Using xfce";
	switch_to_xfce;
else
	echo "Usage: $0 [xfce|dunst]";
fi



exit 0;

XFCE_CONFIG:
