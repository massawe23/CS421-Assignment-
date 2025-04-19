#!/bin/bash

LOGFILE="/var/log/update.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")
API_DIR="/var/www/yhtml"

{
  echo "[$DATE] Starting server and API update..."

  echo "[$DATE] Updating Ubuntu packages..."
  apt update && apt upgrade -y

  echo "[$DATE] Pulling latest code from GitHub..."
  cd "$API_DIR" || { echo "[$DATE] ❌ API directory not found!"; exit 1; }

  GIT_PULL=$(git pull 2>&1)

  if [[ "$GIT_PULL" == *"Already up to date."* || "$GIT_PULL" == *"Updating"* ]]; then
    echo "[$DATE] ✅ Git pull successful:"
    echo "$GIT_PULL"

    echo "[$DATE] Restarting web server..."
    systemctl restart apache2 || systemctl restart nginx

    echo "[$DATE] ✅ Web server restarted."

  else
    echo "[$DATE] ❌ Git pull failed:"
    echo "$GIT_PULL"
    echo "[$DATE] Aborting server restart."
    exit 1
  fi

  echo "[$DATE] ✅ Update process complete."

} >> "$LOGFILE" 2>&1
