FROM intel/oneapi-basekit:2024.2.1-0-devel-ubuntu22.04
COPY . /
RUN mkdir -p build && cd build && cmake -DBUILD_CONFIG=mysql_release -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/tcdata/build ../ && make -j 8 && mkdir -p /tcdata && make install
