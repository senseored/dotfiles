swayidle -w timeout 600 'hyprctl dispatch dpms off' \
	timeout 7200 'systemctl suspend' \
	resume 'hyprctl dispatch dpms on' \
	before-sleep 'swaylock --screenshots --effect-blur 7x5 --clock --indicator --fade-in 2 --indicator-radius 200'
