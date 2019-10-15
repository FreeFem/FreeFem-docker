#!/bin/bash

sudo docker container stop $(sudo docker container ls -aq)
sudo docker container rm $(sudo docker container ls -aq)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)
