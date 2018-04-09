#!/usr/bin/env bash

## Build the docker for FreeFem++ compilation
echo -e "> Building the compiled version of FreeFem++"
docker build --network=host --tag freefem:compilation .
