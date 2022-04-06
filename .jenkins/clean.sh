#!/bin/bash

sudo docker container stop "$(sudo docker container ls -aq)" | true
sudo docker container rm "$(sudo docker container ls -aq)" | true
sudo docker rmi "$(sudo docker images -q)" | true
