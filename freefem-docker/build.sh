## Build the docker for FreeFem++ compilation
sudo docker build --network=host -t freefem .

## Run the docker
#sudo docker run -ti freefem

## Save the docker
sudo docker save -o freefem.tar freefem

## Compress the image
gzip freefem.tar
