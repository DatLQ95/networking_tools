#!/bin/bash

# if [ -z "$var" ]
# then
#       echo "\$var is empty"
# else
#       echo "\$var is NOT empty"
# fi


vlan_id=$1

sudo cp pppoe.conf /etc/ppp/
sudo cp chap-secrets /etc/ppp/
sudo cp pap-secrets /etc/ppp/
sudo cp pppoe-server-options /etc/ppp/
sudo cp options /etc/ppp/

if [[ $vlan_id -gt 10 ]]
then  
    ip_vlan=$(( vlan_id % 255 ))
else 
    ip_vlan=$vlan_id
fi

echo "$ip_vlan"

if [ -z "$vlan_id" ]
then
    sudo ip addr add 192.168.100.1/24 dev enp0s8
    sudo pppoe-server -I enp0s8 192.168.100.1 -R 192.168.100.2-254 -F 
else
    sudo pppoe-server -I enp0s8.$vlan_id 192.168.$ip_vlan.1 -R 192.168.$ip_vlan.2-10 -F
fi
    

# echo "sudo pppoe-server -I enp0s8.$vlan_id 192.168.$ip_vlan.1 -R 192.168.$ip_vlan.2-10 -F "



