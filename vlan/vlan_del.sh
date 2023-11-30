#!/bin/bash

export WAN_PORT=wan
export WAN_PORT

echo "The number of VLAN is: $#"
echo "WAN PORT: $WAN_PORT"
export device=$WAN_PORT
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
    echo "ifconfig $device.$var down"
    ifconfig $device.$var down
    ip addr del 192.168.$ip_vlan.1/24 dev $device.$var
    # vconfig del enp0s8 $var
    python3 remove_vlan.py $ip_vlan
    ip link delete $device.$var type vlan
done

../dhcp/execute-dhcp.sh
