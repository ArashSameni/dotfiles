#!/bin/bash
#
# install.sh - A task runner for installing software and setting up the environment.
# It finds and executes all executable scripts in the 'tasks/' directory.
#
# Usage:
#   ./install.sh            # Runs all tasks in alphabetical order.
#   ./install.sh neovim     # Runs only tasks with "neovim" in the filename.
#   ./install.sh --dry      # Lists the tasks that would run without executing them.

set -e # Exit immediately if a command fails

# Get the absolute path of the directory where this script is located
export SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
TASKS_DIR="$SCRIPT_DIR/tasks"

# --- Argument Parsing ---
filter=""
dry_run=0

for arg in "$@"; do
    if [[ "$arg" == "--dry" ]]; then
        dry_run=1
    else
        filter="$arg"
    fi
done

# --- Main Logic ---
if [[ $dry_run -eq 1 ]]; then
    echo "💧 [DRY RUN] Simulating task execution..."
fi

echo "▶️ Starting task runner..."
if [ -n "$filter" ]; then
    echo "Filtering for tasks containing: '$filter'"
fi

if [ ! -d "$TASKS_DIR" ]; then
    echo "❌ Error: Tasks directory not found at '$TASKS_DIR'"
    exit 1
fi

# Find all executable files in the tasks directory, sorted alphabetically
# The 'sort' command ensures tasks like '01-...' and '02-...' run in order.
for task_script in $(find "$TASKS_DIR" -mindepth 1 -maxdepth 1 -type f -executable | sort); do
    task_name=$(basename "$task_script")

    # If a filter is provided, skip scripts that don't match the filter pattern
    if [ -n "$filter" ] && ! echo "$task_name" | grep -q "$filter"; then
        continue
    fi

    echo ""
    echo "--- Executing task: $task_name ---"
    if [[ $dry_run -eq 0 ]]; then
        # Execute the task script
        "$task_script"
    else
        echo "  (Skipping actual execution due to --dry flag)"
    fi
    echo "--- Finished task: $task_name ---"
done

echo ""
echo "✅ All selected tasks complete."
