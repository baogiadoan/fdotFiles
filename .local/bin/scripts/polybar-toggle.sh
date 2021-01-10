 #!/usr/bin/env bash

id=$(echo $(xdo id -N "Polybar") | cut -d " " -f1)
$(xprop -id $id | grep -q "Normal") && command=hide || command=show
xdo $command -N "Polybar"
