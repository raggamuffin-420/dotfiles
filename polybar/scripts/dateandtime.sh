#!/bin/sh
# displays date and time in a nice, readable format

dayOfMonth=$(date +"%d" | sed 's/^0//')	# get rid of leading zero in date

if [ "$dayOfMonth" == 1 ] || [ "$(($dayOfMonth%10))" == 1 ]; then
	suffix='st'
elif [ "$dayOfMonth" == 2 ] || [ "$(($dayOfMonth%10))" == 2 ]; then
	suffix='nd'
elif [ "$dayOfMonth" == 3 ] || [ "$(($dayOfMonth%10))" == 3 ]; then
	suffix='rd'
else
	suffix='th'
fi

output=$(date +"%A, $dayOfMonth$suffix of %B %Y - %H:%M:%S")
echo $output
