#!/usr/bin/env bash

#Xephyr -ac -br -noreset -screen 1024x768 :1.0 &
Xephyr -ac -br -noreset -screen 1920x1080 :1.0 &
ZEPHYR_PID=$!
sleep 1
DISPLAY=:1.0 awesome -c rc.lua
kill $ZEPHYR_PID

