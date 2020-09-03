FROM ubuntu AS builder

LABEL maintainer="https://github.com/orgs/FreeFem/people"

ARG DEBIAN_FRONTEND=noninteractive
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
    python3-minimal \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV DIRPATH /root/FreeFem-sources

# Copy FreeFEM repository
RUN git clone --depth 1 --single-branch https://github.com/FreeFem/FreeFem-sources.git $DIRPATH

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

# Add executable in PATH
ENV PATH /usr/freefem/bin:$PATH

# Default command
ENV GLOB *.edp
CMD ["bash", "-c", "ls /data/$GLOB | xargs -I {} /usr/freefem/bin/ff-mpirun -n 1 {}"]
