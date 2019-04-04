FROM ubuntu

MAINTAINER Simon Garnotel "simon.garnotel@airthium.com"

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
RUN git clone https://github.com/FreeFem/FreeFem-sources.git /root/FreeFem++-source

# Compile FreeFem++
RUN cd /root/FreeFem++-source \
	&& autoreconf -i \
	&& ./configure --enable-download --enable-optim --prefix=/usr/freefem/ \
	&& ./3rdparty/getall -a \
	&& cd 3rdparty/ff-petsc \
	&& make petsc-slepc \
	&& cd - \
	&& ./reconfigure \
	&& make -j24 \
	&& make check \
	&& make install
