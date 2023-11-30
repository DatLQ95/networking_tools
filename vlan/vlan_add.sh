#!/bin/bash

export WAN_PORT=wan
export WAN_PORT

echo "The number of VLAN is: $#"
echo "WAN PORT: $WAN_PORT"
export device_wan_port=$WAN_PORT
count=0

for vlan_id in "$@"
do
    #if the param is not the number in the range or 1 -> 4098 -> continue
    if expr "$vlan_id" : '[0-9]\+' > /dev/null; then
        echo "$vlan_id is a number"
        if [[ $vlan_id -gt 254 ]]
        then
            ip_vlan=$(( vlan_id % 255 ))
        else
            ip_vlan=$vlan_id
        fi
        echo "Create VLAN '$vlan_id with subnet 192.168.$ip_vlan.0/24'"
        (( count++ ))
        echo $WAN_PORT
        echo $WAN_PORT
        ip link add link $device_wan_port $device_wan_port.$vlan_id type vlan id $vlan_id
	    echo "$ip_vlan and $device_wan_port.$vlan_id"
        ip addr add 192.168.$ip_vlan.1/24 dev $device_wan_port.$vlan_id
        ip link set $device_wan_port.$vlan_id up
        # Append a new pool to dhcp server file and restart it:
        python3 add_vlan.py $ip_vlan
        python3 add_interface.py $device_wan_port
        python3 add_interface.py $device_wan_port.$vlan_id
    else
        echo "$vlan_id is not a number"
    fi

done

../dhcp/execute-dhcp.sh
ip addr flush $device_wan_port.$vlan_id
ip addr add 192.168.$ip_vlan.1/24 dev $device_wan_port.$vlan_id
ip address show dev $device_wan_port.$vlan_id
