#!/usr/bin/env bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# A flexible launch script for Waybar that reloads if already running.

# -----------------------------------------------------
# User Configuration: Set your theme and style here
# -----------------------------------------------------
# THEME_NAME: Name of the theme folder inside ~/.config/waybar/themes
THEME_NAME="ml4w-minimal" # Change this to your actual theme name

# STYLE_VARIATION: Subfolder for the style.
# LEAVE BLANK ("") if style.css is in the main theme folder with the config file.
STYLE_VARIATION=""

# -----------------------------------------------------
# Main Logic: Check, Reload, or Launch
# -----------------------------------------------------

# Check if a Waybar process is already running
if pgrep -x waybar > /dev/null; then
    # If it is, send a signal to reload the style
    echo ":: Waybar is running. Reloading style..."
    pkill -SIGUSR2 waybar
else
    # If it's not, launch a new instance
    echo ":: Waybar not found. Launching..."

    # Define configuration paths and check for custom overrides
    THEME_DIR="$HOME/.config/waybar/themes/$THEME_NAME"

    if [ -n "$STYLE_VARIATION" ]; then
        STYLE_DIR="$THEME_DIR/$STYLE_VARIATION"
    else
        STYLE_DIR="$THEME_DIR"
    fi

    config_filename="config"
    style_filename="style.css"

    if [ -f "$THEME_DIR/config-custom" ]; then
        config_filename="config-custom"
    fi
    if [ -f "$STYLE_DIR/style-custom.css" ]; then
        style_filename="style-custom.css"
    fi

    CONFIG_PATH="$THEME_DIR/$config_filename"
    STYLE_PATH="$STYLE_DIR/$style_filename"

    # Launch Waybar
    if [ -f "$CONFIG_PATH" ] && [ -f "$STYLE_PATH" ]; then
        HYPRLAND_SIGNATURE=$(hyprctl instances -j | jq -r '.[0].instance')
        HYPRLAND_INSTANCE_SIGNATURE="$HYPRLAND_SIGNATURE" waybar -c "$CONFIG_PATH" -s "$STYLE_PATH" &
    else
        echo "ERROR: Theme configuration files not found."
        echo "       Searched for Config: $CONFIG_PATH"
        echo "       Searched for Style:  $STYLE_PATH"
        exit 1
    fi
fi