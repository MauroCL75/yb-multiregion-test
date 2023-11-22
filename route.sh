#!/bin/sh

docker exec -i $1 route del -net 0.0.0.0
docker exec -i $1 route add -net 0.0.0.0/0 gw router



