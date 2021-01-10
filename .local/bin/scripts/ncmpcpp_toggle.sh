#!/usr/bin/env bash


# [[ $(pgrep -cf 'st -n music -e ncmpcpp') -gt 0 ]]
# 
# echo $?

if [[ $(pgrep -cf 'st -n music -e ncmpcpp') -gt 0 ]];
then 
  i3-msg [instance="music"] scratchpad show
else 
  st -n music -e ncmpcpp &
  sleep 0.1
  notify-send "after"
  i3-msg [instance="music"] scratchpad show
fi
