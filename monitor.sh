#!/bin/bash

DATE=$(date)

echo "=========== $DATE ==========" >> $HOME/monitor.log
echo -e "\n\n"  >> $HOME/monitor.log

echo "===========   CPU and Memory usage   ===========" >> $HOME/monitor.log
top -b -n1 | head -15 >> $HOME/monitor.log
echo -e "\n\n"  >> $HOME/monitor.log

echo "===========   Disk usage   ===========" >> $HOME/monitor.log
df -h >> $HOME/monitor.log
echo -e "\n\n"  >> $HOME/monitor.log

echo "===========   Top Processes   ===========" >> $HOME/monitor.log
ps aux --sort=-%cpu | head >> $HOME/monitor.log
echo -e "\n\n"  >> $HOME/monitor.log
echo "=============================" >> $HOME/monitor.log
