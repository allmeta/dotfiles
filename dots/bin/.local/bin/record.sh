notify-send "Recording started"
ffmpeg -f pulse -i default ~/audio/$(date '+%Y_%b_%d-%R:%S').mp3
