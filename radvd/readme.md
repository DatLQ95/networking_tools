First assign the ip address statically to the interface enp0s8:
sudo ip -6 addr add 2001:0db8:0:f101::1/64 dev enp0s8

Config the Router Advertisement Daemon in radvd.conf.

Then run script: 
sudo ./execute_radvd.sh
