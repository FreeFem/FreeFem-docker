#!/usr/bin/env bash

## Build the docker for FreeFEM compilation
echo -e "> Building FreeFEM Docker image"
sudo docker build --network=host --tag freefem .
