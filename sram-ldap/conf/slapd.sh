#!/bin/sh
mkdir -p /run/slapd
chown openldap:openldap /run/slapd

exec /usr/sbin/slapd -d0 \
  -h "ldap:/// ldapi:///" \
  -u "openldap" \
  -g "openldap" \
  -F /etc/ldap/slapd.d
