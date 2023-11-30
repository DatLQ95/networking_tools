#!/usr/bin/python

import sys

vlan = sys.argv[1]

conf_line = "subnet 192.168." + str(vlan) + ".0 netmask 255.255.255.0 {"

detect_mode = False

with open("../dhcp/dhcpd.conf", "r") as f:
    lines = f.readlines()

for line in lines:
    if line.strip("\n") == conf_line:
        detect_mode = True

if not detect_mode:
    with open("../dhcp/dhcpd.conf", "a") as f:
        f.write("\n")
        f.write("subnet 192.168." + str(vlan) + ".0 netmask 255.255.255.0 {\n")
        f.write("\trange 192.168." + str(vlan) + ".2 192.168." + str(vlan) + ".254;\n")
        f.write("\toption routers 192.168." + str(vlan) + ".1;\n")
        f.write("}\n")
