#!/usr/bin/env bash

## Copy the compiled files of Gmsh
echo -e "> Extracting gmsh-compiled from compiled version"
sudo docker run --rm -d gmsh:compilation | sudo xargs -I {} docker cp {}:/usr/gmsh gmsh-compiled

## Build the docker for Gmsh compilation
echo -e "> Building gmsh Docker image"
sudo docker build --network=host -t gmsh .

## Remove compiled files of Gmsh
echo -e "> Remove gmsh-compiled"
sudo rm -R gmsh-compiled

## Save the docker
echo -e "> Saving the gmsh image"
sudo docker save -o gmsh.tar gmsh

## Compress the image
echo -e "> Compressing the archive"
sudo gzip gmsh.tar
