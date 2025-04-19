#!/bin/bash

# === Settings ===
BACKUP_DIR="/home/ubuntu/backups"
API_DIR="/var/www/html"
DB_NAME="cs421_db"
DB_USER="root"
DB_PASS="amos123"
LOGFILE="/var/log/backup.log"
DATE=$(date +%F)

# === Create Backup Directory if not exists ===
mkdir -p "$BACKUP_DIR"

# === API Files Backup ===
tar -czf "$BACKUP_DIR/api_backup_$DATE.tar.gz" "$API_DIR"

# === Database Backup ===
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/db_backup_$DATE.sql"

# === Check if backups were created ===
if [[ $? -eq 0 ]]; then
  echo "[$(date)] ✅ Backup successful." >> "$LOGFILE"
else
  echo "[$(date)] ❌ Backup failed." >> "$LOGFILE"
fi

# === Delete backups older than 7 days ===
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;
