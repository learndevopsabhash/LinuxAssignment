#!/bin/bash

echo "================================="
echo " Linux System Monitoring Tool"
echo "================================="
echo "1. Monitor using HTOP"
echo "2. Monitor using NMON"
echo "3. Exit"
echo "================================="

read -p "Choose an option: " option

case $option in

1)
    echo "Starting HTOP..."
    htop
    ;;

2)
    echo "Starting NMON..."
    nmon
    ;;

3)
    echo "Exiting..."
    exit
    ;;

*)
    echo "Invalid option. Please select 1, 2 or 3."
    ;;

esac
