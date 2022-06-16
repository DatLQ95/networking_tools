touch /var/lib/dhcp/dhcpd6.leases
cp dhcpd6.conf /etc/dhcp/
systemctl stop isc-dhcp-server6.service
systemctl start isc-dhcp-server6.service