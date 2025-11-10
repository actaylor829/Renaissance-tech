#!/bin/bash
# Simple backup script for RHEL 8
DATE=$(date +%F_%H-%M-%S)
DEST="/var/backups/$DATE"
echo "[*] Starting backup process..." 
# Create destination directory
sudo mkdir -p "$DEST"
# Backup key directories
sudo tar -czf "$DEST/etc.tar.gz" /etc
sudo tar -czf "$DEST/home.tar.gz" /home
# Log completion
echo "Backup completed on $DATE" | sudo tee -a /var/log/backup.log

echo "[+] Backup saved to $DEST"

