ANS=$(echo " Lock| Logout| Reboot| Shutdown" | \
                rofi -sep "|" -dmenu -i -p 'System ' "" -width 20 \
		-hide-scrollbar -eh 1 -line-padding 4 -padding 50 -lines 4)
case "$ANS" in 
	*Lock) betterlockscreen -l ;;
	*Logout) loginctl terminate-session $(loginctl session-status | head -n 1 | awk '{print $1}') ;;
	*Reboot) systemctl reboot ;;
	*Shutdown) systemctl poweroff
esac

