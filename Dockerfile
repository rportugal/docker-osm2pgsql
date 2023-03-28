FROM alpine:3.17

WORKDIR /app
ENV OSM2PGSQL_VERSION 1.8.1

RUN apk update

# Dependencies
RUN apk add --no-cache \
    boost-dev \
    lua \
    lua-dev

# Build-time only dependencies
RUN apk add --no-cache \
    bzip2-dev \ 
    cmake \ 
    expat-dev \
    g++ \
    git \
    make \
    postgresql-dev \
    zlib-dev
RUN git clone --depth 1 --branch ${OSM2PGSQL_VERSION} https://github.com/openstreetmap/osm2pgsql.git
RUN cd osm2pgsql && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j8 && \ 
    make install

ENTRYPOINT ["/bin/sh"]

