DockerID=XXX

## Get FreeFem++ sources
hg clone http://www.freefem.org/ff++/ff++

## Build the docker for FreeFem++ compilation
sudo docker build --network=host -t freefem0 .

## Copy the compiled files of FreeFem++
sudo docker cp $DockerID:/usr/freefem ./ff++-compiled

## Copy the compiled files to freefem-docker
sudo cp -R ff-compiled ../freefem-docker/ff-compiled

