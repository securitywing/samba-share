#!/bin/bash
yum -y install samba samba-client samba-common
systemctl start smb
systemctl enable smb
useradd sambauser
mkdir -p /home/share
chmod -R 0775 /home/share
chown -R sambauser:sambauser /home/share

cat >> /etc/samba/smb.conf <<EOL
[share]
	comment = sambauser File Server Share
	path = /home/share
	browsable =yes
	writable = yes
	guest ok = yes
	read only = no
	force user = sambauser
EOL


groupadd smbgrp
usermod sambauser -aG smbgrp
smbpasswd -a sambauser
# Type a password
systemctl restart smb

# Access the folder inside virtual machine
# \\ip-of-your-virtual-box\share
