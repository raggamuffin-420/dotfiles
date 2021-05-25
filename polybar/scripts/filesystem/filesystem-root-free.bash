#!/bin/bash
# prints disk usage info on the (cli-argument-)specified filesystem

mountpoint=$(df -h $1 | awk '/dev/ {print $6}')
totalSize=$(df -h $1 | awk '/dev/ {print $2}')
usedPercentage=$(df -h $1 | awk '/dev/ {print $5}')

echo ${mountpoint}: $usedPercentage of $totalSize
