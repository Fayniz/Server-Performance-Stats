#!/bin/bash

echo "######################"
echo "# System Uptime Info #"
echo "######################"

uptime

echo

echo "###################"
echo "# Total CPU Usage #"
echo "###################"

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo

echo "######################"
echo "# Total Memory Usage #"
echo "######################"
free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024^2, $3/$2 * 100, $4/1024^2, $4/$2 * 100}'

echo

echo "####################"
echo "# Total Disk Usage #"
echo "####################"
