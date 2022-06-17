modprobe wireguard
systemctl enable wg-quick@wg0
wg-quick down wg0
# Copy the config the file: 
cp wg0.conf /etc/wireguard/wg0.conf

# Start the VPN: 
wg-quick up wg0
wg show wg0