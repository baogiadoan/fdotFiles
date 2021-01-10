#!/bin/sh

if [[ -z $(pgrep -f "urxvt -name floater") ]];
then
  urxvt -name floater &
  sleep 0.2
  i3-msg '[instance=floater]' move scratchpad
fi

i3-msg '[instance=floater]' scratchpad show
