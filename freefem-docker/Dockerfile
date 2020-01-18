FROM ubuntu AS builder

LABEL maintainer="https://github.com/orgs/FreeFem/people"

# Install dependencies
RUN apt-get update && apt-get install -y \
    automake \
    bison \
    cmake \
    flex \
    g++ \
    gfortran \
    git \
    make \
    libopenblas-dev \
    libhdf5-dev \
    libgsl-dev \
    libarpack2 \
    libfftw3-dev \
    libnlopt-dev \
    libmpich-dev \
    patch \
    pkg-config \
    python-minimal \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV DIRPATH /root/FreeFem-sources

# Copy FreeFEM repository
RUN git clone --depth 1 -b develop --single-branch https://github.com/FreeFem/FreeFem-sources.git $DIRPATH

WORKDIR $DIRPATH

# Configure FreeFEM and download PETSc
RUN autoreconf -i \
    && ./configure --enable-download --enable-optim --enable-generic --prefix=/usr/freefem/ \
    && ./3rdparty/getall -o PETSc -a

# Compile PETSc/SLEPc and reconfigure FreeFEM
RUN cd $DIRPATH/3rdparty/ff-petsc \
    && make petsc-slepc

# Reconfigure and compile FreeFEM
RUN ./reconfigure && make -j 1

# Install FreeFEM
RUN make install

FROM ubuntu

LABEL maintainer="https://github.com/orgs/FreeFem/people"

# Install dependencies
RUN apt-get update && apt-get install -y \
    libopenblas-dev \
    libhdf5-dev \
    libgsl-dev \
    libarpack2 \
    libfftw3-dev \
    libnlopt-dev \
    libmpich-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy FreeFEM repository
RUN mkdir /usr/freefem
COPY --from=builder /usr/freefem /usr/freefem

# Add FreeFEM to .bashrc
RUN touch /root/.bash_aliases \
    && echo "alias bamg='/usr/freefem/bin/bamg'" > /root/.bash_aliases \
    && echo "alias cvmsh2='/usr/freefem/bin/cvmsh2'" > /root/.bash_aliases \
    && echo "alias ff-c++='/usr/freefem/bin/ff-c++'" > /root/.bash_aliases \
    && echo "alias ff-get-dep='/usr/freefem/bin/ff-get-dep'" > /root/.bash_aliases \
    && echo "alias ffmaster='/usr/freefem/bin/ffmaster'" > /root/.bash_aliases \
    && echo "alias ff-mpirun='/usr/freefem/bin/ff-mpirun'" >> /root/.bash_aliases \
    && echo "alias ff-pkg-download='/usr/freefem/bin/ff-pkg-download'" >> /root/.bash_aliases \
    && echo "alias FreeFem++='/usr/freefem/bin/FreeFem++'" >> /root/.bash_aliases \
    && echo "alias FreeFem++-mpi='/usr/freefem/bin/FreeFem++-mpi'" >> /root/.bash_aliases \
    && echo "alias FreeFem++-nw='/usr/freefem/bin/FreeFem++-nw'" >> /root/.bash_aliases

ENV GLOB *.edp
CMD ["bash", "-c", "ls /data/$GLOB | xargs -I {} ff-mpirun -n 1 {}"]
