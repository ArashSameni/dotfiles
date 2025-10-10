#!/bin/bash

# Wait for the desktop environment to be ready
sleep 1

# Launch applications in specific workspaces
hyprctl dispatch exec [workspace 1 silent] firefox &
hyprctl dispatch exec [workspace 2 silent] kitty &
hyprctl dispatch exec [workspace 9 silent] Telegram &
hyprctl dispatch exec [workspace 10 silent] /opt/v2rayn-bin/v2rayN &

