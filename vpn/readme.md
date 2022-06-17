# This is Wireguard VPN server set up and running. 
# First download the VPN wireguard server to machine: 
run ./install_vpn.sh
# Modify the configuration in wg0.conf
# Run ./execute_vpn.sh
# Enable the service: 
Please refer to this link [here](https://www.wireguard.com/quickstart/) for more info. 
How to add the new peer: 
sudo wg set wg0 peer PUBLIC_KEY_FROM_CLIENT allowed-ips 10.6.1.2/32 endpoint 10.5.1.34:51820
