#!/usr/bin/env bash

# Prints the local IP address as a statusline symbol.

WIFI_IFACE_NAME='wlan0'
ETHER_IFACE_NAME='enp2s0'

WIFI_IP=$(ip address show dev "$WIFI_IFACE_NAME" | grep 'inet ' | awk '{print $2}' | awk -F\/ '{print $1}')
ETHER_IP=$(ip address show dev "$ETHER_IFACE_NAME" | grep 'inet ' | awk '{print $2}' | awk -F\/ '{print $1}')

if [ -n "$WIFI_IP" -a -n "$ETHER_IP" ]; then
    OUTPUT="%{F$(xgetres baraccentfg)}直%{F-} $WIFI_IP   %{F$(xgetres baraccentfg)}%{F-} $ETHER_IP"
elif [ -n "$WIFI_IP" ]; then
    OUTPUT="%{F$(xgetres baraccentfg)}直%{F-} $WIFI_IP"
elif [ -n "$ETHER_IP" ];then
    OUTPUT="%{F$(xgetres baraccentfg)}%{F-} $ETHER_IP"
else
    OUTPUT=''
fi

echo "$OUTPUT"
