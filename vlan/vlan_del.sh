#!/bin/bash

#remove vlan in dhcpd.conf file

echo "The number of VLAN is: $#"
count=0
for var in "$@"
do
    echo "Create VLAN '$var'"
    (( count++ ))
    if [[ $var -gt 254 ]]
    then  
        ip_vlan=$(( var % 255 ))
    else 
        ip_vlan=$var
    fi
    ifconfig enp0s8.$var down
    ip addr del 192.168.$ip_vlan.1/24 dev enp0s8.$var
    # vconfig del enp0s8 $var
    python3 remove_vlan.py $ip_vlan
    ip link delete enp0s8.$var type vlan
done

../dhcp/execute-dhcp.sh

# Set up VLAN as their scenario:


# vconfig add enp0s8 101
# ip addr add 192.168.5.1/24 dev enp0s8.101
# ifconfig enp0s8.101 up

# vconfig add enp0s8 201
# ip addr add 192.168.6.1/24 dev enp0s8.201
# ifconfig enp0s8.201 up

# vconfig add enp0s8 7
# ip addr add 192.168.8.1/24 dev enp0s8.7
# ifconfig enp0s8.7 up

# vconfig add enp0s8 51
# ip addr add 192.168.9.1/24 dev enp0s8.51
# ifconfig enp0s8.51 up

# vconfig add enp0s8 54
# ip addr add 192.168.10.1/24 dev enp0s8.54
# ifconfig enp0s8.54 up

# vconfig add enp0s8 52
# ip addr add 192.168.11.1/24 dev enp0s8.52
# ifconfig enp0s8.52 up

#Restart the dhcp server:
# systemctl restart isc-dhcp-server

# # Run the VLC streaming TV:
# cd video/
