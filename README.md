# PHP Student & Subject API

A simple PHP-based API that provides student and subject data in JSON format.

## 🚀 API Endpoints
- **GET `/student`** → Returns a list of students.
- **GET `/subjects`** → Returns subjects categorized by year.

## Backup Schemes

### 1. Full Backup
- **Execution**: Copies all files and databases every time.
- **Advantages**: Easy restoration, complete copy each time.
- **Disadvantages**: Time-consuming and requires a lot of storage.

### 2. Incremental Backup
- **Execution**: Backs up only the changes since the last backup (full or incremental).
- **Advantages**: Faster and uses less storage.
- **Disadvantages**: Restore time is longer since you need the last full + all incrementals.

### 3. Differential Backup
- **Execution**: Backs up all changes since the last full backup.
- **Advantages**: Faster restore than incremental.
- **Disadvantages**: Requires more space than incremental.

##  Bash Scripts for Server Management

This repo includes automation scripts for managing the deployed API on an AWS EC2 Ubuntu instance.

### Scripts

- **health_check.sh**: Checks CPU, RAM, disk, web server, and API endpoints. Logs to `/var/log/server_health.log`.
- **backup_api.sh**: Backs up API project files and database. Logs to `/var/log/backup.log`. Old backups (7+ days) are deleted.
- **update_server.sh**: Updates system packages, pulls latest code, restarts the web server. Logs to `/var/log/update.log`.

### ⚙️ Setup Instructions

1. Upload scripts to the EC2 server using `scp` or `git clone`.
2. Make them executable:
   ```bash
   chmod +x health_check.sh backup_api.sh update_server.sh

## 🔧 Setup
1. Clone the repo:  
   ```sh
   git clone https://github.com/massawe23/CS421-Assignment-.git
