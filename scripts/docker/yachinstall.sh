#!/bin/bash

# Install yacht.sh
docker volume create yacht
docker pull selfhostedpro/yacht
docker run -d -p 8001:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht
