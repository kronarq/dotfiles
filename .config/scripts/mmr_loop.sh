#!/bin/bash

while true
do
	xdotool mousemove_relative --sync 5 5
	sleep 0.1
	xdotool mousemove_relative --sync -- -5 -5
	sleep 120
done
