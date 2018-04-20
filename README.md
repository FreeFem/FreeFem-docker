# Gmsh docker

Docker image of [Gmsh](http://gmsh.info/).

<!-- TOC depthFrom:2 -->

- [Usage](#usage)

<!-- /TOC -->

## Usage

Extract `gmshX.XX.tar.gz` (available in the [releases](https://github.com/Tanatloc/Gmsh-docker/releases)) using:

```bash
gunzip gmshX.XX.tar.gz
```

Load the image in Docker:

```bash
docker load --input gmshX.XX.tar
```

Start the Docker image in interactive mode:

```bash
docker run -ti gmsh
```

Execute all the `*.edp` scripts available in the current directory

```bash
docker run -v $(pwd):/data gmsh
```
