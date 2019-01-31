#!/usr/bin/bash

export LC_CTYPE=en_US.UTF8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Terminate already running bar instances
#killall -q polybar
echo "Killing polybar..."
kill -9 $(ps aux | grep polybar | grep -v grep | grep -v launch.sh | awk '{print $2}')

# Wait until the processes have been shut down
echo "Waiting for polybar to stop..."
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "Launching polybar..."
polybar -q -r main &
polybar -q -r left &
polybar -q -r right &
#polybar -q -r top &

echo "Bars launched..."
