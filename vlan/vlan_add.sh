#!/bin/bash

echo "The number of VLAN is: $#"
device="enp0s8"
count=0

for vlan_id in "$@"
do
    if [[ $vlan_id -gt 254 ]]
    then  
        ip_vlan=$(( vlan_id % 255 ))
    else 
        ip_vlan=$vlan_id
    fi
    echo "Create VLAN '$vlan_id with subnet 192.168.$ip_vlan.0/24'"
    (( count++ ))
    vconfig add $device $vlan_id
    ip addr add 192.168.$ip_vlan.1/24 dev $device.$vlan_id
    ifconfig $device.$vlan_id up
    # Append a new pool to dhcp server file and restart it:
    python3 add_vlan.py $ip_vlan
    python3 add_interface.py $device
    python3 add_interface.py $device.$vlan_id
done

../dhcp/execute-dhcp.sh

ifconfig $device.$vlan_id
