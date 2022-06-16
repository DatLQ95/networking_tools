
sudo ip route add 239.1.2.30/32 dev enp0s8

vlc big_buck_bunny_720p_5mb.mp4 --sout udp:239.1.2.30 --ttl 5 --loop
