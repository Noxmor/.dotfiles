#!/bin/bash

# Copyright (c) 2025 Noxmor

BT_POWERED=$(bluetoothctl show | grep "Powered: yes")
PAIRED_DEVICES=$(bluetoothctl devices Paired | cut -d ' ' -f 2-)

if [ -z "$BT_POWERED" ]; then
    ICON="󰂲"
    STATUS="Bluetooth Disabled"
    CLASS="off"
else
    ICON="󰂯"
    CLASS="on"
    if [ -z "$PAIRED_DEVICES" ]; then
        STATUS="Bluetooth Enabled - No paired devices"
    else
        STATUS="Bluetooth Enabled - Paired devices:\n$PAIRED_DEVICES"
    fi
fi

echo "{\"text\": \"$ICON\", \"tooltip\": \"$STATUS\", \"class\": \"$CLASS\" }"
