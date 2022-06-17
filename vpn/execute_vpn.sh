# Copy the config the file: 
sudo cp wg0.conf /etc/wireguard/wg0.conf

# Start the VPN: 
sudo modprobe wireguard
sudo wg-quick up wg0
sudo systemctl enable wg-quick@wg0
sudo wg show wg0