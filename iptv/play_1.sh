# sudo ip route del 239.255.3.22/32 dev enp0s8.4
sudo ip route add 239.255.3.22/32 dev enp0s8

vlc big_buck_bunny_720p_5mb.mp4 --sout udp:239.255.3.22 --ttl 5 --loop
