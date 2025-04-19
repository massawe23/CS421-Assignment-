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
## 🔧 Setup
1. Clone the repo:  
   ```sh
   git clone https://github.com/massawe23/CS421-Assignment-.git
