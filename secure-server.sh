#!/bin/bash
apt update && apt upgrade -y
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban
apt install clamav clamav-daemon -y
freshclam
systemctl enable clamav-daemon
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh
apt install docker.io docker-compose -y
systemctl enable docker
chmod 750 ./company-a
chmod 750 ./company-b
echo "DONE - Server Secured!"
