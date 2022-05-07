#!/bin/sh
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -a -q)
docker-compose up -d
sleep 2 
docker exec mongo mongo admin ./setup/create-admin.js
