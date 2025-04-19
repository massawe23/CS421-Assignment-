#!/bin/bash

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Make sure log file exists
touch "$LOG_FILE"

# Memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.2f", $3/$2 * 100)}')

# Disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}')

# API health check
API1_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://13.53.98.144/subjects.php)
API2_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://13.53.98.144/student.php)

# Logging results
echo "$TIMESTAMP | Memory: ${MEMORY_USAGE}% | Disk: $DISK_USAGE | API1: $API1_STATUS | API2: $API2_STATUS" >> "$LOG_FILE"

# Check if services are healthy
if [[ "$API1_STATUS" == "200" && "$API2_STATUS" == "200" ]]; then
    echo "$TIMESTAMP | All services healthy" >> "$LOG_FILE"
else
    echo "$TIMESTAMP | One or more services are down!" >> "$LOG_FILE"
fi
