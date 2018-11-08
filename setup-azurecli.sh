#!/bin/bash

#Azure CLI
sudo yum install -y gcc python libffi-devel python-devel openssl-devel
curl -L https://aka.ms/InstallAzureCli | bash
exec -l $SHELL
