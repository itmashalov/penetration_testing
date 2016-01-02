#!/bin/bash

#This will be called on the target system as root. 
 
yum install nmap
yum install nikto
git clone https://github.com/sullo/nikto
git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
