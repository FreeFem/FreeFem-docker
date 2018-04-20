#!/usr/bin/env bash

## Build the docker for Gmsh compilation
echo -e "> Building the compiled version of Gmsh"
sudo docker build --network=host --tag gmsh:compilation .
