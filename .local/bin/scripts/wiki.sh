#!/usr/bin/env bash

# check_todo_active=$( pgrep -fx "st -e nvim /home/gautierk/Documents/journal/journal.md /home/gautierk/Documents/journal/mistakes.md /home/gautierk/Documents/journal/books.md /home/gautierk/Documents/journal/charisma.md /home/gautierk/Documents/journal/dreams.md /home/gautierk/Documents/journal/quotes.md")
check_wiki_active="$(ps -aux | grep -c "[n]vim index.wiki")"

# notify-send "Status: $check_wiki_active"


if [[ $check_wiki_active -gt 0 ]]
then
  i3-msg workspace 15:Wiki
  # notify-send "active"
else
  i3-msg workspace 15:Wiki
  # notify-send "not active"
  cd ~/.vimwiki
  st -e nvim index.wiki
fi
