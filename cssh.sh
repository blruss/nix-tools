#!/bin/bash
#Scipt to automate ssh connections between multiple nodes. 
##Requires a list of hostnames/ips be created first named /etc/grid.hosts.
##Usage cssh.sh "cmd1;cmd2"


if [ -f "/etc/gridhosts" ]
    then
        for x in `cat /etc/gridhosts | grep -v $HOSTNAME `; do ssh $x $1 ; done
    else
        echo
        echo "ERROR: /etc/gridhosts NOT FOUND!"
        echo "A list of hosts to ssh to is required, please create /etc/gridhosts file"
fi
