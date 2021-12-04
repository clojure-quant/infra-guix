#!/bin/sh

if [ "$1" = "-h" ]; then
	cat <<EOF>&2
Usage: ${0##*/}

Automatically unmount external drives mounted with 'udisks'.

EOF
	exit
fi

while IFS= read -r i; do
	udisksctl unmount -b "$(findmnt -n --output SOURCE "$i")"
done <<EOF
$(find /media/$USER -maxdepth 1 -mindepth 1 -type d)
EOF
