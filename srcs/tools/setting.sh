#! /bin/bash

# Execute Permissions
if [ ! -f "$HOME/.config/weather" ]; then
    chmod +x weather
    mv weather $HOME/.config/	
    echo "# weather path" >> $HOME/.zshrc
    echo "export PATH='$PATH:$HOME/.config/'" >> $HOME/.zshrc 
    echo " " >> $HOME/.zshrc
    echo "# disk status" >> $HOME/.zshrc
    echo "bash ~/.config/clear_cache.sh" >> $HOME/.zshrc

    cp srcs/tools/clear_cache.sh $HOME/.config/
    cp srcs/tools/create_status.sh $HOME/.config/
    cp srcs/tools/remove_status.sh $HOME/.config/
fi
