#!/bin/sh

# This script switches the default audio output device (sink) to the next one available.

# Get the name of the current default sink.
CURRENT_DEFAULT_SINK=$(pactl get-default-sink)

# Get a list of all available sink names.
SINK_NAMES=($(pactl list sinks | grep -oP 'Name: \K\S+'))

# Find the index of the current default sink in the list.
for i in "${!SINK_NAMES[@]}"; do
   if [[ "${SINK_NAMES[$i]}" == "$CURRENT_DEFAULT_SINK" ]]; then
       CURRENT_INDEX=$i
   fi
done

# Calculate the index of the next sink, looping back to the start if necessary.
NEXT_INDEX=$(((CURRENT_INDEX + 1) % ${#SINK_NAMES[@]}))

# Get the name of the next sink.
NEXT_SINK_NAME=${SINK_NAMES[$NEXT_INDEX]}

# Set the next sink as the new default.
pactl set-default-sink "$NEXT_SINK_NAME"