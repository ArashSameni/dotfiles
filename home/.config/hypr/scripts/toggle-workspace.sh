#!/bin/bash

# The workspace to switch to is the first argument
TARGET_WORKSPACE=$1

# Get the current active workspace ID using hyprctl and jq
CURRENT_WORKSPACE=$(hyprctl activeworkspace -j | jq -r '.id')

# Check if we are already on the target workspace
if [ "$CURRENT_WORKSPACE" -eq "$TARGET_WORKSPACE" ]; then
    # If yes, switch to the previously focused workspace
    hyprctl dispatch workspace previous
else
    # If no, switch to the target workspace as usual
    hyprctl dispatch workspace "$TARGET_WORKSPACE"
fi