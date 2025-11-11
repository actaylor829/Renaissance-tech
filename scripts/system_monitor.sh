#!/bin/bash
# system_monitor.sh

echo "[*] System Health Report"
echo "Uptime: $(uptime -p)"
echo "Disk Usage:"
df -h | grep -E 'Filesystem|/dev/'
echo "Memory Usage:"
free -h
echo "Top 5 CPU-consuming processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
