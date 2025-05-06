

#!/bin/bash


echo "---------------------------------------"
echo "      SYSTEM HEALTH MONITOR"
echo "---------------------------------------"
echo "Hostname: $(hostname)"
echo "Date & Time: $(date)"
echo "---------------------------------------"

echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "CPU Load: " $2 + $4 "%"}'
echo ""

# Memory Usage
echo "Memory Usage:"
free -h | awk '/^Mem/ {print "Used: "$3" / Total: "$2}'
echo ""

# Disk Usage
echo "Disk Usage:"
df -h --total | grep 'total' | awk '{print "Used: "$3" / Total: "$2}'
echo ""

# Uptime
echo "System Uptime:"
uptime -p
echo ""

# Optional: List top 5 memory-consuming processes
echo "Top 5 Memory Consuming Processes:"
ps aux --sort=-%mem | head -n 6
echo ""

