FROM ubuntu

MAINTAINER Simon Garnotel "simon.garnotel@airthium.com"

# Update aptitude
RUN apt-get update

# Upgrade
RUN apt-get upgrade -y && apt-get clean

# Install dependencies
RUN apt-get install -y \
	coinor-libipopt-dev \
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
	libopenmpi-dev

# Copy ff repository
RUN mkdir /usr/freefem
ADD ff++-compiled /usr/freefem

# Add FreeFem++ to bashrc
RUN touch /root/.bash_aliases \
	&& echo "alias bamg='/usr/freefem/bin/bamg'" > /root/.bash_aliases \
	&& echo "alias cvmsh2='/usr/freefem/bin/cvmsh2'" > /root/.bash_aliases \
	&& echo "alias ff-c++='/usr/freefem/bin/ff-c++'" > /root/.bash_aliases \
	&& echo "alias ff-get-dep='/usr/freefem/bin/ff-get-dep'" > /root/.bash_aliases \
	&& echo "alias ffmaster='/usr/freefem/bin/ffmaster'" > /root/.bash_aliases \
	&& echo "alias ff-mpirun='/usr/freefem/bin/ff-mpirun --allow-run-as-root'" >> /root/.bash_aliases \
	&& echo "alias ff-pkg-download='/usr/freefem/bin/ff-pkg-download'" >> /root/.bash_aliases \
	&& echo "alias FreeFem++='/usr/freefem/bin/FreeFem++'" >> /root/.bash_aliases \
	&& echo "alias FreeFem++-mpi='/usr/freefem/bin/FreeFem++-mpi'" >> /root/.bash_aliases \
	&& echo "alias FreeFem++-nw='/usr/freefem/bin/FreeFem++-nw'" >> /root/.bash_aliases

ENV GLOB *.edp
CMD ["bash", "-c", "ls /data/$GLOB | xargs -I {} /usr/freefem/bin/FreeFem++ {}"]
