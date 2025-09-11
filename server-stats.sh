#!/bin/bash

echo "##########################"
top -bn1 | grep "Cpu" | cut -f 4 -d "," | awk '{print "CPU usage:" 100 - $1 "%"}'

echo "##########################"
top -bn1 | grep "MiB Mem" | cut -f 2 -d ":" | awk '{printf "Total Memory: %.2f Gi\n", $1 /1024 }'
top -bn1 | grep "MiB Mem" | cut -f 2 -d ":" | awk '{printf "Used Memory: %.2f Gi(%.1f%%)\n", $3 /1024 , $3 / $1 * 100 }'
top -bn1 | grep "MiB Mem" | cut -f 2 -d ":" | awk '{printf "Free Memory: %.2f Gi(%.1f%%)\n", $5 /1024 , $5 / $1 * 100 }'
echo "##########################"

df -h | grep /nvme0n1p2 | awk '{print "Disk Size  " $2 }'
df -h | grep /nvme0n1p2 | awk '{print "Disk Used  " $3 " " $5}'
df -h | grep /nvme0n1p2 | awk '{print "Free Space " $2 - $3 "G " 100 - $5 "%"}'
