# docker-osm2pgsql
[![Docker Pulls](https://badgen.net/docker/pulls/rportugal/osm2pgsql?icon=docker&label=pulls)](https://hub.docker.com/r/rportugal/osm2pgsql/)


## Build from Dockerfile

```
docker build -t rportugal/osm2pgsql github.com/rportugal/docker-osm2pgsql.git
```

## Run command

```
docker run -i -t --rm rportugal/osm2pgsql -c 'osm2pgsql -v'
```
