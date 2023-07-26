#!/bin/bash

# Find the line number containing "weather path"
line_number=$(grep -n "disk status" $HOME/.zshrc | cut -d: -f1)

# Check if "weather path" is found in the script
if [ -z "$line_number" ]; then
    echo "# disk status" >> $HOME/.zshrc
    echo "bash ~/.config/clear_cache.sh" >> $HOME/.zshrc
    echo "Successfully add 'disk status' and the next line."
else
    echo "The 'disk status' line already in script."
fi
