#!/bin/sh

# Displays how many files are in the trash-cli trashcan currently

itemCount="$(du -hd 0 $HOME/.local/share/Trash/files/* 2>/dev/null | wc -l)"
usedSpace="$(du -hc $HOME/.local/share/Trash/files/* 2>/dev/null | tail --lines=1 | awk '{print $1}')"


if [ -n "$(ls -A $HOME/.local/share/Trash/files 2>/dev/null)" ]
then
	echo "%{F$(xgetres baraccentfg)}%{F-} $itemCount" '~' "$usedSpace""B" ; exit 0
else
	echo "%{F$(xgetres baraccentfg)}%{F-} $(trash-list | wc -l)" ; exit 0
fi
