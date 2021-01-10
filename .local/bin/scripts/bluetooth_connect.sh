#!/usr/bin/env bash

if [[ $1 == "connect" ]];
then
  bluetoothctl connect 00:00:E0:0C:75:CE
else
  bluetoothctl disconnect 00:00:E0:0C:75:CE
fi
