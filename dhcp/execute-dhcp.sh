cp ~/dhcp/dhcpd.conf /etc/dhcp/
cp ~/dhcp/isc-dhcp-server /etc/default/
# rm -f /var/lib/dhcp/dhcpd.leases
systemctl stop isc-dhcp-server
systemctl start isc-dhcp-server

