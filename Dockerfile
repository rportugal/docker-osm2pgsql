FROM alpine:3.17 as builder 

WORKDIR /app
ENV OSM2PGSQL_VERSION 1.8.1

RUN apk update && apk --no-cache add git

RUN git clone --depth 1 --branch ${OSM2PGSQL_VERSION} https://github.com/openstreetmap/osm2pgsql.git

RUN apk --no-cache add \
    cmake \ 
    make \
    g++ \
    boost-dev \
    expat-dev \
    bzip2-dev \
    zlib-dev \
    libpq \
    proj-dev \
    lua5.3-dev \
    postgresql-dev

RUN cd osm2pgsql && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j8

RUN cd osm2pgsql && \
    cd build && \ 
    make DESTDIR=./install install

FROM alpine:3.17
RUN apk add --no-cache \
    boost-dev \
    libpq \
    proj-dev \
    lua5.3-dev
WORKDIR /root
COPY --from=builder /app/osm2pgsql/build/install /
ENTRYPOINT ["/bin/sh"]

