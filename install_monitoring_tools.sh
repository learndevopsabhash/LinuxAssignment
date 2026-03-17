#!/bin/bash

# List of tools
TOOLS=("htop" "nmon")

for tool in "${TOOLS[@]}"
do
    if command -v $tool &> /dev/null
    then
        echo "$tool is already installed."
    else
        echo "$tool is not installed. Installing..."
        sudo dnf install -y $tool
        
        if command -v $tool &> /dev/null
        then
            echo "$tool installed successfully."
        else
            echo "Failed to install $tool."
        fi
    fi
done
