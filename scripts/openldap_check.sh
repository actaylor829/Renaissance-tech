#!/bin/bash
# openldap_check.sh


echo "[*] Checking OpenLDAP service and configuration..."
if systemctl is-active --quiet slapd; then
	echo "slapd: ACTIVE"
else
	echo "slapd: INACTIVE - starting service..."
	sudo systemctl enable --now slapd
fi
echo "[*] Testing LDAP search..."
ldapsearch -x -b "dc=example, dc=com" -H ldap://localhost | head -10 || echo "LDAP search failed. Verify base DN or configuration."
