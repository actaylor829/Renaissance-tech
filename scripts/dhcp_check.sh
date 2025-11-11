#!/bin/bash
# dhcp_check.sh

echo "[*] Checking DHCP service..."
if systemctl is-active --quiet dhcp; then
	echo "dhcp: ACTIVE"
else
	echo "dhcp: INACTIVE - starting service..."
	sudo systemctl enable --now dhcpd
fi

echo "[*] Checking for active leases..."
sudo cat /var/lib/dhcpd/dhcpd.lease | tail -n 5
