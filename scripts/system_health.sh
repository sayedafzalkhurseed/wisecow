#!/bin/bash

LOG_FILE="system_health.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "===== System Health Check: $(date) =====" >> $LOG_FILE

# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_USAGE=${CPU_USAGE%.*}

# Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

# Disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Log values
echo "CPU Usage: $CPU_USAGE%" >> $LOG_FILE
echo "Memory Usage: $MEM_USAGE%" >> $LOG_FILE
echo "Disk Usage: $DISK_USAGE%" >> $LOG_FILE

# Alerts
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "ALERT: High CPU usage!" >> $LOG_FILE
fi

if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "ALERT: High Memory usage!" >> $LOG_FILE
fi

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "ALERT: High Disk usage!" >> $LOG_FILE
fi

echo "======================================" >> $LOG_FILE
