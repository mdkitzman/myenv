#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Find any files in the script directory that are NOT executable and fix them
find "$SCRIPT_DIR" -type f ! -perm +111 -exec chmod +x {} +

# Get a list of all files in the script directory, excluding this 'command.sh' script
SCRIPTS=$(ls $SCRIPT_DIR | grep "\.sh$" | grep -v "^command.sh$")

# Pass that list into gum filter
SELECTED_SCRIPT=$(echo "$SCRIPTS" | gum filter --placeholder "Find script...")

# If the user didn't hit escape, execute the selected script
if [ -n "$SELECTED_SCRIPT" ]; then
    echo "🚀 Running $SELECTED_SCRIPT..."
    # Execute the file from the script directory
    $SCRIPT_DIR/$SELECTED_SCRIPT
else
    echo "Cancelled."
fi
