#!/bin/bash
#script to copy files across multiple nodes using scp.
#requires list of hosts in /etc/gridhosts.

if [ -f "/etc/gridhosts" ]
    then
       for x in `cat /etc/gridhosts | grep -v $HOSTNAME`; do scp $1 $x:$2 ; done
    else
        echo
        echo "ERROR: /etc/gridhosts NOT FOUND!"
        echo "A list of hosts to ssh to is required, please create /etc/gridhosts file"
        echo "Unable to scp file."
fi
