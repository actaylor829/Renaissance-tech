# Renaissance-tech: RHEL 8 Automation Suite 
This project automates **Rhel 8 system hardening, backup, and service verification** using *Ansible* and shell scripts.

-- Features
##System Hardening
- Disables root login over SSH
- Enforces password authentication and SSH configuration compliance.
- Install and initializes AIDE
##Backup Automation
 - Backs up critical configuration files and logs.
 - Uses shell scripts to ensure versioned and timestamped backups.
##Service Verification
- Open LDAP verification:** Confirms LDAP authentication service is reachable and configured.
- DNS Check: Validates Dns service resolution.
- DHCP Check:** Ensures DHCP service availability and configuration.
- HTTPD Service:** Automatically installs and starts Apache web service (if required).
##System Monitoring
- Runs lightweght monitoring script for resource usage, running services, and process checks.
- Generates summarized output inside Ansible for quick review.

---

Technologies used
- *RHEL 8*
- *Ansible 2.16*
- ** Bash scripting**
- ** YAML Playbooks**
- ** Virtualbox / RHELVM**

---
