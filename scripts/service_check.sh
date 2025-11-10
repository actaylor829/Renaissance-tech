#!/bin/bash
echo "[*] Checking system-critical services..."
for svc in sshd httpd firewalld; do
	if systemctl is-active --quiet "$svc"; then
	echo "$svc: ACTIVE"
	else
	echo "$svc: INACTIVE"
fi
done

echo "[+] Service status check complete"
