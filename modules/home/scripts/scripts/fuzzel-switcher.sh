#!/bin/bash

# Get the list of open windows with their addresses and titles from hyprctl
# We filter out windows that don't have a title to avoid empty entries
WINDOWS=$(hyprctl clients -j | jq -r '.[] | select(.title!="") | "\(.address)\t\(.title)"')

# Use fuzzel to display the list and get the selected window's address
SELECTED=$(echo -e "$WINDOWS" | fuzzel --dmenu --prompt 'Switch to: ' | awk '{print $1}')

# If a window was selected, focus it
if [ -n "$SELECTED" ]; then
    hyprctl dispatch focuswindow address:$SELECTED
fi