#Add multicast: 

# sudo ip route del 239.1.1.11/32 dev enp0s8.54
sudo ip route add 239.1.1.10/32 dev enp0s8

# sudo ip route del 239.1.1.11/32 dev enp0s8
# sudo ip route add 239.1.1.11/32 dev enp0s8.54

vlc big_buck_bunny_720p_5mb.mp4 --sout udp:239.1.1.10 --ttl 5 --loop
