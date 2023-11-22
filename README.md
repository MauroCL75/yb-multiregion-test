# yb-multiregion-test

This is a 2 regions Yugabyte configuration with 3 servers on each region. Regions are:
* UK
* ZA

Regions are connected through a router. Each one of the router interfaces has a different latency.

# Requirements
You will need:
* A Linux machine.
* Docker and docker compose
* tc to simulate latency

# Using this

Run `make build` to start it. The `prep.sh` script will create the storage tree directory to handle the 6 servers. It also remove it first.

# Parameters
You might change the params file to change the default fault tolerance config.
