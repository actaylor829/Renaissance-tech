#!/bin/bash
set -e
echo "[*] Starting RHEL 8 hardening..."


# Backup sshd config before editing
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak.$(date +%F)

# Disable root login and enforce password authentication
sudo sed -i 's|^#\?PermitRootLogin.*|PermitRootLogin no|' /etc/ssh/sshd_config
sudo sed -i 's|^#\?PasswordAuthentication.*|PasswordAuthentication yes|' /etc/ssh/sshd_config


# Restart SSH service to apply
sudo systemctl restart sshd
echo "[+] SSh configuration hardened"

# Install and initialize AIDE for integrity checking
sudo dnf -y install aide
sudo aide --init || true
sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz || true
echo "[+] AIDE integrity database created"

# Install and configure Apache as an example service
sudo dnf -y install httpd
sudo systemctl enable --now httpd
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
echo "[+] Firewall configured and Apache running"
echo "[*] Hardening complete"
 
