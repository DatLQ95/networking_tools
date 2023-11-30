#!/bin/bash

s_tag=$1
c_tag=$2
echo "The Q-in-Q vlan with S-tag is $s_tag and C-tag is $c_tag in enp0s8"
export WAN_PORT=wan
device=$WAN_PORT


if [[ $c_tag -gt 254 ]]
then
    ip_vlan_c_tag=$(( c_tag % 255 ))
else
    ip_vlan_c_tag=$c_tag
fi
echo "Create C-VLAN $c_tag with subnet 192.168.$ip_vlan_c_tag.0/24'"

if [[ $s_tag -gt 254 ]]
then
    ip_vlan_s_tag=$(( s_tag % 255 ))
else
    ip_vlan_s_tag=$s_tag
fi
echo "Create S-VLAN $s_tag with subnet 192.168.$ip_vlan_s_tag.0/24'"

ip link add link $device $device.$c_tag type vlan proto 802.1ad id $c_tag
ip link add link $device.$c_tag $device.$c_tag.$s_tag type vlan proto 802.1Q id $s_tag

ip addr add 192.168.$ip_vlan_c_tag.1/24 dev $device.$c_tag.$s_tag
ip addr add 192.168.$ip_vlan_s_tag.1/24 dev $device.$c_tag

ifconfig $device.$c_tag up
ifconfig $device.$c_tag.$s_tag up

python3 add_vlan.py $ip_vlan_c_tag
python3 add_vlan.py $ip_vlan_s_tag

python3 add_interface.py $device
python3 add_interface.py $device.$c_tag
python3 add_interface.py $device.$c_tag.$s_tag

../dhcp/execute-dhcp.sh

ifconfig $device.$c_tag.$s_tag
ifconfig $device.$c_tag
