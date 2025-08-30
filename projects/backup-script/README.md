# Mini-projet : Backup Script
Script Bash pour archiver et compresser un dossier, avec exclusions et logs.

## Usage
```bash
./backup.sh <source_dir> [--exclude pattern1,pattern2,...]
# Exemple
./backup.sh /home/devops/labs --exclude node_modules,*.tmp
