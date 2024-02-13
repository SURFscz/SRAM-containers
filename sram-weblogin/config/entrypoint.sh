#!/bin/sh

# Prepare ssh...
mkdir -p /run/sshd

# Make sure all existinig settings are neutralised....

sed -i 's/^UsePAM .*//g' /etc/ssh/sshd_config
sed -i 's/^KbdInteractiveAuthentication .*//g' /etc/ssh/sshd_config

# Now set my settings !
echo 'UsePAM yes' >> /etc/ssh/sshd_config
echo 'KbdInteractiveAuthentication yes' >> /etc/ssh/sshd_config
echo 'AuthenticationMethods keyboard-interactive:pam' >> /etc/ssh/sshd_config

cat << EOF > /etc/security/pam-weblogin.conf
url=${URL}
token=${TOKEN}
retries=${RETRIES:-3}
attribute=${ATTRIBUTE:-username}
cache_duration=${CACHE_DURATION:-60}
pam_user
EOF

chmod 600 /etc/security/pam-weblogin.conf

echo "auth sufficient /lib/x86_64-linux-gnu/security/pam_weblogin.so /etc/security/pam-weblogin.conf" > /etc/pam.d/weblogin
sed -i '2i@include weblogin' /etc/pam.d/sshd

exec $@
