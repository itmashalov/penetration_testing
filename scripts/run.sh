#!/bin/bash

#This will scan all the ports of the servers and will show the opened and the closed ports.
#The result will be written to file portslog.log 

#========================This functionality allows to select file manualy===============================
#logger -s "Please enter the name of the cluster file: "
#read filename
#search=$(find $filename)
# if [ "$search" = "$filename" ]; then
  	
#=======================================================================================================

source ~/.bash_profile
while read line
 
do
    cluster[$index]=$(dig +short $line)  
    index=$(($index+1))
 
done < "../cluster"
#done < "$filename"

#else
# ./run.sh
#fi

#Nmap port scanner		 
nmap ${cluster[@]} > "../nmap.log" 

#nikto vulnerability scanner
nikto/program/nikto.pl -h ../cluster -output ../vulnerabilities.txt

#sqlmap sql injection scanner
python sqlmap-dev/sqlmap.py -m ../cluster

logger -s "Done. Please Check the Log files"
 #nmap ${cluster[@]} > "$filename.log"
 

