#!/bin/bash

# extra nodes/launchers to start after 'roscore'
declare -a nodes=(\
"roslaunch rosbridge_server rosbridge_websocket.launch" \ 
"rosrun tf2_web_republisher tf2_web_republisher" \
"roslaunch freenect_launch freenect-registered-xyzrgb.launch" \
"rosrun web_video_server web_video_server _address:=192.168.1.152 _port:=9999" \
)

# sleep variable
sleep_time="2"

# set first tab to start 'roscore'
tabs=(--tab -e "bash -c 'roscore'")

# create a new tab for each node with a
# sleep delay to allow 'roscore' to start first
for n in "${nodes[@]}"
do
  node_cmd="bash -c 'sleep $sleep_time; $n'"
  tabs+=(--tab -e "$node_cmd")
done

# open all the tabs in a new terminal
gnome-terminal "${tabs[@]}"



