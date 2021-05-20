#!/usr/bin/env bash

Headphones="$(ponymix | grep -c "Google")"

if [[ $Headphones -gt 0 ]];
then
  ponymix $1 $2 --max-volume 100
else
  ponymix $1 $2 --max-volume 150
fi

