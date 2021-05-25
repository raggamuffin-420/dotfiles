#!/usr/bin/env bash

# Outputs a statusline text containing package update information.

# Count pacman updates
if ! UPDATES_ARCH=$(checkupdates 2> /dev/null | wc -l ); then
    UPDATES_ARCH=0
fi

# Count AUR updates
if ! UPDATES_AUR=$(paru -Qum 2> /dev/null | wc -l); then
    UPDATES_AUR=0
fi

OUTPUT=''

if [ "$UPDATES_ARCH" -gt 0 ]; then
    OUTPUT="%{F$(xgetres baraccentfg)}%{F-} $UPDATES_ARCH"
fi

if [ "$UPDATES_AUR" -gt 0 ]; then
    if [ -z "$OUTPUT" ]; then
        OUTPUT="%{F$(xgetres baraccentfg)}%{F-} $UPDATES_AUR"
    else
        OUTPUT="%{F$(xgetres baraccentfg)}%{F-} $UPDATES_AUR  $OUTPUT"
    fi
fi

echo "$OUTPUT"
