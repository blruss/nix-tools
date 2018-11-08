#!/bin/bash
#Fix DNS by updating /etc/resolv.conf with different name server values with option to override for another domain. Used in my lab domains to fix dns to point to my DNS vs default peerdns.

echo #ORIGINAL /etc/resolv.conf#
cat /etc/resolv.conf
echo #########################

echo #BACKUP UP original to  /etc/resolv.conf.bkup#
sudo cp  /etc/resolv.conf /etc/resolv.conf.bkup

 if [[ $1 = TSAD ]] 
 then
 rm -rf /etc/resolv.conf
 touch/etc/resolv.conf
        echo "search example.com dev.example.com prod.example.com " >> /etc/resolv.conf
        echo "nameserver 10.X.X.X" >> /etc/resolv.conf
        echo "nameserver 10.X.X.X" >> /etc/resolv.conf
        echo "domain example.com" >> /etc/resolve.conf
else
        sudo rm -rf /etc/resolv.conf
        sudo touch /etc/resolv.conf
        echo "search example.com dev.example.com prod.example.com " >> /etc/resolv.conf
        echo "nameserver 10.X.X.X" >> /etc/resolv.conf
        echo "nameserver 10.X.X.X" >> /etc/resolv.conf
        echo "domain example.com" >> /etc/resolve.conf
fi
echo ################################
echo "New /etc/resolv.conf entries"
cat /etc/resolv.conf
echo ################################
