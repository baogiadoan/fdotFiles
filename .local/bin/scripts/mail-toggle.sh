#!/bin/sh

if [[ -z $(pgrep -f thunderbird) ]];
then
  thunderbird
fi

# if [[ -z $(pgrep -f neomutt) ]];
# then
#   st -n mail -e neomutt &
# fi


i3-msg workspace 10:Mail
