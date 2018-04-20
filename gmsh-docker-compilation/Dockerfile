FROM ubuntu

MAINTAINER Simon Garnotel "simon.garnotel@airthium.com"

# Update aptitude
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Install dependencies
RUN apt-get update && apt-get install -y \
	cmake \
	g++ \
	gfortran \
	git \
	libopenblas-dev \
	liblapack-dev

# Open-cascade
ADD opencascade-7.2.0.tgz /root/opencascade/
RUN cd /root/opencascade \
	&& cd opencascade-7.2.0 \
	&& mkdir build \
	&& cd build \
	&& cmake .. \
	&& make -j24 \
	&& sudo make install

# Copy gmsh repository
RUN git clone https://gitlab.onelab.info/gmsh/gmsh.git /root/Gmsh-source

# Compile Gmsh
RUN cd /root/Gmsh-source \
	&& mkdir build \
	&& cd build \
	&& cmake .. \
	&& make -j24 \
	&& make test \
	&& sudo make install
