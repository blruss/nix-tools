#!/bin.bash

#RUN SAS Viya Container. Variable $1 for port for web server and $2 for image to run.

echo "Available Docker Images"
docker images

echo "currently used ports"
lsof -i tcp | grep LISTEN


echo "Usage dvrun.sh port tag"

docker run \
    --detach \
    --rm \
    --env CASENV_CAS_VIRTUAL_HOST=$(hostname) \
    --env CASENV_CAS_VIRTUAL_PORT=$1 \
    --publish-all \
    --publish $1:80 \
#   --name viya-centrify-1 \
#   --hostname viya-centrify-1 \
    $2
