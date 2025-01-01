#!/bin/bash

# Find and kill the blueman-applet process
process_name="mako"

# Check if the process is running
pid=$(pgrep "$process_name")

if [ -n "$pid" ]; then
    # echo "Killing $process_name (PID: $pid)..."
    kill -9 $pid
    # echo "$process_name has been terminated."
fi
# else
#     echo "$process_name is not running."
# fi
