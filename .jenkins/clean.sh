#!/bin/bash

sudo docker container stop $(sudo docker container ls -aq)
sudo docker container rm $(sudo docker container ls -aq)
sudo docker rmi $(sudo docker images -q)
