swayidle -w timeout 60 'swaylock -f -c 000000' \
	timeout 120 'hyprctl dispatch dpms off' \
	timeout 180 'loginctl suspend' \
	resume 'hyprctl dispatch dpms on' \
	before-sleep 'swaylock -f -c 000000' 
