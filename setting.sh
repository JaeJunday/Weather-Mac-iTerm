#! /bin/bash

# Execute Permissions
if [ ! -f "$HOME/.config/weather" ]; then
    chmod +x weather
    mv weather $HOME/.config/	
    echo "# weather path" >> $HOME/.zshrc
    echo "export PATH='$PATH:$HOME/.config/'" >> $HOME/.zshrc 
fi
