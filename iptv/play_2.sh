sudo ip route del 239.3.1.125/32 dev enp0s8.54
sudo ip route add 239.3.1.125/32 dev enp0s8.4

vlc bbb_sunflower_1080p_30fps_normal.mp4 --sout udp:239.3.1.125 --ttl 5 --loop
