# FreeFem++ docker

Docker image of [FreeFem++](http://www.freefem.org/).

## Usage

Extract `freefemX.XX.tar.gz` using:
```bash
gunzip freefemX.XX.tar.gz 
```

Load the image in Docker:
```bash
docker load --input freefemX.XX.tar
```

Start the Docker image:
```bash
docker run -ti freefem
```
