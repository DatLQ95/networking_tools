#!/bin/bash

s_tag=$1
c_tag=$2
echo "The Q-in-Q vlan with S-tag is $s_tag and C-tag is $c_tag in enp0s8"
device="enp0s8"


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
echo "Create C-VLAN $s_tag with subnet 192.168.$ip_vlan_s_tag.0/24'"

ip link add link $device $device.$s_tag type vlan proto 802.1ad id $s_tag
ip link add link $device.$s_tag $device.$s_tag.$c_tag type vlan proto 802.1Q id $c_tag

ip addr add 192.168.$ip_vlan_c_tag.1/24 dev $device.$s_tag.$c_tag
ip addr add 192.168.$ip_vlan_s_tag.1/24 dev $device.$s_tag

ifconfig $device.$s_tag up
ifconfig $device.$s_tag.$c_tag up

python3 add_vlan.py $ip_vlan_c_tag
python3 add_vlan.py $ip_vlan_s_tag

python3 add_interface.py $device
python3 add_interface.py $device.$s_tag
python3 add_interface.py $device.$s_tag.$c_tag

../dhcp/execute-dhcp.sh

ifconfig $device.$s_tag.$c_tag
ifconfig $device.$s_tag
