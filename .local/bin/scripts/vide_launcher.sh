#!/bin/bash

PROJECTDIR="$HOME/Projects"


ls "$PROJECTDIR" \
    | rofi -dmenu -p "Vide " -matching "fuzzy" \
    | xargs -i --no-run-if-empty st -e zsh -c "cd /home/gautierk/Projects/{}; /home/gautierk/.local/bin/scripts/vide /home/gautierk/Projects/{}; zsh" 
    # | xargs -i --no-run-if-empty notify-send "Hello"

# | xargs -i --no-run-if-empty notify-send "vide {}"
# st -e zsh &


    # | xargs -i --no-run-if-empty st -e "vide {}"

# exit 0
