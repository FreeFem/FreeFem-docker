FROM ubuntu

MAINTAINER Simon Garnotel "simon.garnotel@gmail.com"

# Update aptitude
RUN apt-get update && apt-get upgrade -y && apt-get clean

# Install dependencies
RUN apt-get install -y \
	autoconf \
	automake \
	autotools-dev \
	bison \
	cmake \
	coinor-libipopt-dev \
	cpp \
	flex \
	g++ \
	gcc \
	gdb \
	gfortran \
	ghostscript \
	git \
	mercurial \
	m4 \
	make \
	libopenblas-dev \
	liblapack-dev \
	libhdf5-dev \
	libgsl-dev \
	libscotch-dev \
	libfftw3-dev \
	libarpack2-dev \
	libsuitesparse-dev \
	libmumps-seq-dev \
	libnlopt-dev \
	libgmm++-dev \
	libtet1.5-dev \
	libopenmpi-dev \
	patch \
	pkg-config \
	python \
	unzip \
	valgrind \
	wget

# Copy ff++ repository
RUN hg clone http://www.freefem.org/ff++/ff++ /root/ff++

# Compile FreeFem++
RUN cd /root/ff++ \
	&& autoreconf -i \
	&& ./configure --enable-download --enable-optim --disable-pastix --prefix=/usr/freefem/ \
	&& ./download/getall -a \
	&& cd download/ff-petsc \
	&& sed -e 's/--download-pastix //g' Makefile \
	&& make petsc-slepc \
	&& cd - \
	&& ./reconfigure \
	&& make -j24 \
	&& make check \
	&& make install

