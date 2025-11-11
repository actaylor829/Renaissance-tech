#!/bin/bash
# dns_check.sh


echo "[*] Checking DNS (named) service..."
if systemctl is-acive --quiet named; then
	echo "named: Active"
else
	echo"named: INACTIVE - starting service..."
	sudo systemctl enable --now named
fi
echo "[*] Verifying zone files..."
sudo named-checkconf
sudo named-checkzone example.com /var/named/example.com.zone
