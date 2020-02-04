notify-send "Recording started"
ffmpeg -f pulse -i default ~/audio/"$(date +%y-%m-%d_%H:%M:%S)".mp3
