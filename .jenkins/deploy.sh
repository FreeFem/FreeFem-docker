#!/bin/bash

## Save the docker
echo -e "> Saving the freefem image"
sudo docker save -o freefem.tar freefem

## Compress the image
echo -e "> Compressing the archive"
sudo gzip freefem.tar

## Deploy to GitHub releases
echo -e "> Deploy to GitHub releases"
TOKEN=$1
ORGANIZATION='FreeFem'
REPOSITORY='FreeFem-docker'
FILE_NAME='freefem.tar.gz'

# Get the current release number from sources
SOURCE_REPOSITORY='FreeFem-sources'
CURRENT_VERSION=`curl 'https://api.github.com/repos/'$ORGANIZATION'/'$SOURCE_REPOSITORY'/releases/latest' | jq -r '.tag_name'`

echo 'Current FreeFEM version: '$CURRENT_VERSION

# Create the release (keep the upload url)
RELEASE_PARAMETERS=$(printf '{"tag_name": "%s", "target_commitish": "master", "name": "%s", "body": "FreeFEM docker - FreeFEM v%s.", "draft": false, "prerelease": false}' $CURRENT_VERSION $CURRENT_VERSION $CURRENT_VERSION)
RELEASE=`curl -H "Authorization: token $TOKEN" --data "$RELEASE_PARAMETERS" 'https://api.github.com/repos/'$ORGANIZATION'/'$REPOSITORY'/releases'`
UPLOAD_URL=`echo $RELEASE | jq -r '.upload_url'`
echo 'Upload URL: '$ASSETS_URL

# Upload asset
RESPONSE=`curl --data-binary @"$FILE_NAME" -H "Authorization: token $TOKEN" -H "Content-Type: application/octet-stream" "$UPLOAD_URL=$FILE_NAME"`
echo 'Server response: '$RESPONSE
