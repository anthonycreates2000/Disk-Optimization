#!/bin/sh
# This program is made by Anthony Kevin Oktavius

# This function will manage systemd journal, just as described
# in the manual page.
SystemdJournal(){
	# $* = Extra arguments to be inserted to free command
	# To be inserted to journalctl.
	journalctl $*
}

# This will perform infinite loop.
while true
do
	echo "======================================================="
	echo "BEFORE CLEANING:"
	DISK_USAGE_ARGUMENT="--disk-usage" # Argument for showing disk usage for journalctl.
	SystemdJournal ${DISK_USAGE_ARGUMENT}
	echo ""

	LIMIT_SIZE_ARGUMENT="--vacuum-size=10M" # Argument for limiting journalctl log up to 10MB.
	ROTATE_ARGUMENT="--rotate"
	SystemdJournal ${ROTATE_ARGUMENT}
	SystemdJournal ${LIMIT_SIZE_ARGUMENT}
	echo ""

	echo "AFTER CLEANING:"
	SystemdJournal ${DISK_USAGE_ARGUMENT}
	echo "======================================================="
	# Pause the process for 3 seconds.
	sleep 3s
done
