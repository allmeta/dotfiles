ANS=$(echo " Lock| Logout| Reboot| Shutdown" | \
                rofi -sep "|" -dmenu -i -p 'System ' "" -width 20 \
		-hide-scrollbar -eh 1 -line-padding 4 -padding 50 -lines 4)
case "$ANS" in 
	*Lock) betterlockscreen -l ;;
	*Logout) i3-msg exit ;;
	*Reboot) openrc-shutdown -r 0  ;;
	*Shutdown) openrc-shutdown -p 0
esac

