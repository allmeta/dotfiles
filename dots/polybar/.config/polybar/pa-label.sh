port=$(pacmd list-sinks | grep active) 
if echo "$port" | grep -q headset; then
    echo 
else if echo "$port" | grep -q headphone; then
    echo 
else
    echo 
fi