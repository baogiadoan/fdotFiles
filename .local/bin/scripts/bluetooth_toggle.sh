#!/usr/bin/env bash

if [[ $(bluetoothctl info | grep -c "Connected: yes") -gt 0 ]];
then
  notify-send "Disconnecting Blue"
  bluetoothctl disconnect 00:00:E0:0C:75:CE
else
  notify-send "Connecting Blue"
  bluetoothctl connect 00:00:E0:0C:75:CE
fi

