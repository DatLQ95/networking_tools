#!/usr/bin/python

import sys

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

with open("../dhcp/dhcpd.conf", "r") as f:
    lines = f.readlines()
delete_mode = False
with open("../dhcp/dhcpd.conf", "w") as f:
    for line in lines:
        if not delete_mode:
            if line.strip("\n") == conf_lines:
                delete_mode = True
            else:
                f.write(line)
        else:
            if line.strip("\n") == "}":
                delete_mode = False
