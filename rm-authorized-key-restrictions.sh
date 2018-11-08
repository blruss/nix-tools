#!/bin/bash

cd $HOME/.ssh
cp authorized_keys authorized_keys.orig

echo "#######################################"
echo Original authorized_keys file content prior to changes.
cat authorized_keys
echo "#######################################"

sudo cat authorized_keys | cut -d" " -f14-15 > authorized_keys.new


mv authorized_keys.new authorized_keys

echo "#######################################"
echo New RSA Keys without restrictions on user login
cat authorized_keys
echo "#######################################"
