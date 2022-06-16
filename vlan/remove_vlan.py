#!/usr/bin/python

import sys
import os

print(sys.argv[1])
vlans = sys.argv[1:]
print(vlans)

# Create list of lines need to be deleted:
def delete_conf():
    conf_lines = list()
    for vlan in vlans:
        conf_lines.append("subnet 192.168." + str(vlan) + ".0 netmask 255.255.255.0 {")
    return conf_lines
conf_lines = delete_conf()
print(conf_lines)

# with open('etc-files/dhcp/dhcpd.conf', "r+") as f:
#     for line in f:
#         print(line)
#         if line in conf_lines:
#             print("found it!")
#             # for the next 3 lines, delete it
#         else :

with open("../dhcp/dhcpd.conf", "r") as f:
    lines = f.readlines()
delete_mode = False
with open("../dhcp/dhcpd.conf", "w") as f:
    for line in lines:
        if delete_mode == False: 
            if line.strip("\n") == conf_lines:
                delete_mode = True
            else: 
                f.write(line)
        else :
            if line.strip("\n") == "}":
                delete_mode = False