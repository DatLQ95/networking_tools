# Start modprobe
modprobe 8021q

ip addr add 10.5.1.1/24 dev enp0s8
ifconfig enp0s8 up

ifconfig enp0s9 up

systemctl start isc-dhcp-server
