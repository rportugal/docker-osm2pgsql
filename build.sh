#!/usr/bin/env bash

set -e

docker buildx use "osm2pgsql" || docker buildx create --use --name "osm2pgsql"

docker buildx build --push \
   --platform linux/amd64 \
   -t rportugal/osm2pgsql:1.8.1 .
