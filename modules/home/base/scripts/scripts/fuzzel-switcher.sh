#!/bin/sh

# A robust script for a Hyprland window switcher with icons using fuzzel.
# This version uses direct pipelines and arrays to work correctly and efficiently.

# Check if hyprctl and jq are available
if ! command -v hyprctl &> /dev/null || ! command -v jq &> /dev/null; then
    echo "Error: hyprctl and jq are required for this script." >&2
    exit 1
fi

# Populate arrays with window data from hyprctl
mapfile -t addresses < <(hyprctl clients -j | jq -r '.[].address')
mapfile -t titles < <(hyprctl clients -j | jq -r '.[].title')
mapfile -t classes < <(hyprctl clients -j | jq -r '.[].class')

# Check if there are any windows to show
if [ ${#titles[@]} -eq 0 ]; then
    exit 0
fi

# Function to generate the formatted list for fuzzel
generate_fuzzel_input() {
    for i in "${!titles[@]}"; do
        # Skip windows with no title
        if [ -z "${titles[$i]}" ]; then
            continue
        fi
        
        local title="${titles[$i]}"
        local class="${classes[$i]}"
        local icon_name
        icon_name=$(echo "$class" | tr '[:upper:]' '[:lower:]')
        
        # Output the formatted string for fuzzel
        printf "%s\0icon\x1f%s\n" "$title" "$icon_name"
    done
}

# Generate the list and pipe it directly into fuzzel.
# Fuzzel's output (the selected title) is captured in the variable.
# This avoids the "ignored null byte" warning and incomplete lists.
selected_title=$(generate_fuzzel_input | fuzzel --dmenu --prompt ' ➜  ')

# If the user cancelled (e.g., pressed Esc), exit.
if [ -z "$selected_title" ]; then
    exit 0
fi

# Find the address corresponding to the selected title.
selected_address=""
for i in "${!titles[@]}"; do
    if [ "${titles[$i]}" = "$selected_title" ];
    then
        selected_address="${addresses[$i]}"
        break
    fi
done

# If we found an address, switch focus.
if [ -n "$selected_address" ]; then
    hyprctl dispatch focuswindow address:"$selected_address"
fi