#!/usr/bin/python

import sys
import os

interface = sys.argv[1]

detect_mode = False
with open("../dhcp/isc-dhcp-server", "r") as f:
    lines = f.readlines()

for line in lines:
    if "INTERFACES" in line:
        if interface in line: 
            detect_mode = True
        else:
            detect_mode = False
            new_line = line[:-2] + " " + interface + '"\n' 

if detect_mode == False: 
    lines = lines[:-1]
    lines.append(new_line)
    with open("../dhcp/isc-dhcp-server", "w+") as f:
        for line in lines:
            f.write(line)
