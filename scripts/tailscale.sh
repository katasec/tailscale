#!/usr/bin/env bash

# Check auth key was passed
env
if [ -z "$KEY" ]
then
      echo "Environment Variable \$KEY is empty, exitting!"
      exit 1
fi

# Configure User mode networking for tailscale daemon
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &

# Start tailscale and advertise as exit node
tailscale up --authkey=$KEY --advertise-exit-node


# Inifinite loop
while true; 
do 
    echo "$(date), Sleeping 30 seconds..."
    sleep 30
done