cp radvd.conf /etc/radvd.conf
# Enable IPv6 forward:
sysctl -w net.ipv6.conf.default.forwarding=1
# Reload it to take effect
sysctl --system
# Restart the radvd service:
# sudo ip -6 addr add 2001:db8:89::1/48 dev enp0s8
systemctl stop radvd.service
systemctl start radvd.service
