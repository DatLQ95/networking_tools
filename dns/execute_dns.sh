#!/bin/sh

# copy all the files to the /etc/bind
cp named.conf.options /etc/bind/named.conf.options
cp named.conf.local /etc/bind/named.conf.local
# cp named.conf.certbot /etc/bind/named.conf.certbot
# Copy all the zone files to /var/lib/bind
cp zones/* /var/lib/bind

# Set up the dns name in /etc/resolv.conf?

# Check the configs:
named-checkconf
named-checkzone helloworld.com /var/lib/bind/db.helloworld.com
named-checkzone 10.5.1.in-addr.arpa /var/lib/bind/db.10.5.1
# named-checkzone _acme-challenge.helloworld.com /var/lib/bind/db._acme-challenge.helloworld.com

# Start the DNS server
systemctl stop bind9
systemctl start bind9