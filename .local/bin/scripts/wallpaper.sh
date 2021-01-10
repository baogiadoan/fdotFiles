#!/usr/bin/env bash 

NUMMO=`xrandr -q | grep -c " connected"`

# for i in $(seq 0 $(expr ${NUMMO} - 1))
# do
#   nitrogen --head=$i --set-zoom-fill --random ~/Backgrounds
# done

for i in $(seq 0 $(expr ${NUMMO} - 1))
do
  nitrogen --head=$i --set-zoom-fill ~/Backgrounds/pheonix.jpg
done


# while true; do

#   case $NUMMO in
#     "1")
#       ;;
#     "2")
#       ;;
#     "3")
#   if [ $NUMMO -eq "2" ]
#   then
#      nitrogen --head=0 --set-zoom-fill --random ~/Backgrounds
#      nitrogen --head=1 --set-zoom-fill --random ~/Backgrounds
#   else
#      nitrogen --set-zoom-fill --random ~/Backgrounds
#   fi
   
#   sleep 10m
#   done
