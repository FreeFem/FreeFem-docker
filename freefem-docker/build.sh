#!/usr/bin/env bash

## Copy the compiled files of FreeFem++
echo -e "> Extracting ff++-compiled from compiled version"
sudo docker run --rm -d freefem:compilation | xargs -I {} docker cp {}:/usr/freefem /tmp/ff++-compiled

## Build the docker for FreeFem++ compilation
echo -e "> Building freefem++ Docker image"
sudo docker build -t freefem .

## Save the docker
echo -e "> Saving the freefem image"
sudo docker save -o freefem.tar freefem

## Compress the image
echo -e "> Compressing the archive"
gzip freefem.tar
