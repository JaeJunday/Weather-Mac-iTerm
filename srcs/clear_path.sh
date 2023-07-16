#!/bin/bash

# Find the line number containing "weather path"
line_number=$(grep -n "weather path" $HOME/.zshrc | cut -d: -f1)

# Check if "weather path" is found in the script
if [ -n "$line_number" ]; then
    # Calculate the next line number (line after "weather path")
    next_line_number=$((line_number + 1))
    
    # Calculate the line number to delete after the next line
    line_to_delete=$((line_number + 2))

    # Delete the line containing "weather path" and the next two lines
    sed -i.bak "${line_number},${line_to_delete}d" $HOME/.zshrc
    echo "Successfully removed 'weather path' and the next line."
else
    echo "The 'weather path' line was not found in the script."
fi
