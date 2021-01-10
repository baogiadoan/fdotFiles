#!/usr/bin/env bash

#check_todo_active=$(pgrep -fx "st -e nvim /home/gautierk/.todo/general/todo.txt /home/gautierk/.todo/hw/todo.txt /home/gautierk/.todo/shopping/todo.txt /home/gautierk/.todo/blogideas/todo.txt")

check_todo_active="$(ps -aux | grep -c "general-todo.txt")"
# notify-send "$check_todo_active"

files="$(ls ~/.todo/ | grep todo | tr '\n' ' ')"
# notify-send "$files"

if [ $check_todo_active -gt 1 ]
then
  i3-msg workspace 14:Todo
else
  i3-msg workspace 14:Todo
  cd ~/.todo
  st -e nvim $files
  #st -e nvim ~/.todo/general/todo.txt ~/.todo/hw/todo.txt ~/.todo/shopping/todo.txt /home/gautierk/.todo/blogideas/todo.txt
fi

# #!/usr/bin/env bash
# 
# check_todo_active=$(pgrep -fx "st -e nvim /home/gautierk/.todo/general/todo.txt")
# 
# if [ $check_todo_active ]
# then
#   i3-msg workspace 20:
#   i3-msg mode "Todo"
# else
#   i3-msg workspace 21:
#   sleep .1
#   st -e nvim ~/.todo/hw/todo.txt -name "hwtodo" &
#   sleep .1
#   i3-msg workspace 22:
#   sleep .1
#   st -e nvim ~/.todo/shopping/todo.txt -name "shoptodo" &
#   sleep .1
#   i3-msg workspace 20:
#   sleep .1
#   st -e nvim ~/.todo/general/todo.txt &
#   sleep .1
#   i3-msg mode "Todo"
# fi
