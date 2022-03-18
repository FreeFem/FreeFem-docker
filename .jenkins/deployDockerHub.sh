#!/bin/bash

# Login
docker login -u sgarnotel -p $DOCKER_TOKEN

# Get the current release number from sources
ORGANIZATION='FreeFem'
SOURCE_REPOSITORY='FreeFem-sources'
CURRENT_VERSION=`curl 'https://api.github.com/repos/'$ORGANIZATION'/'$SOURCE_REPOSITORY'/releases/latest' | jq -r '.tag_name'`

# Tag
docker tag freefem:latest freefem/freefem:latest
docker tag freefem:latest freefem/freefem:$CURRENT_VERSION

# Push
docker push freefem/freefem:latest
docker push freefem/freefem:$CURRENT_VERSION
