# FreeFem++ docker

Docker image of [FreeFem++](http://www.freefem.org/).

<!-- TOC depthFrom:2 -->

- [Usage](#usage)

<!-- /TOC -->

## Usage

Extract `freefemX.XX.tar.gz` (available in the [releases](https://github.com/FreeFem/FreeFem-docker/releases)) using:

```bash
gunzip freefemX.XX.tar.gz 
```

Load the image in Docker:

```bash
docker load --input freefemX.XX.tar
```

Start the Docker image in interactive mode:

```bash
docker run -ti freefem
```

Execute all the `*.edp` scripts available in the current directory

```bash
docker run -v $(pwd):/data freefem
```
