FROM intel/oneapi-basekit:2024.2.1-0-devel-ubuntu22.04
COPY . /
RUN nproc
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libssl-dev bison libncurses5-dev libtirpc-dev dpkg-dev git build-essential cmake pkg-config
RUN mkdir -p build && cd build && cmake -DBUILD_CONFIG=mysql_release -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/tcdata/build ../ && make -j 8 mysqld
