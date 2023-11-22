#!/bin/sh

Y=100
N=0
#nets="uknet zanet aunet"
nets="uknet zanet"
for net in $nets; do
  name=`docker network ls | grep $net | awk '{print $1}'`
  br=""
  br=`brctl show | grep $name | awk '{print $1}'`
  if [ $br != "" ]; then
    echo $net $name $br
    if [ $N -gt 1 ]; then
      n=$(($RANDOM%($Y+$N)+$Y))
      echo "#network $br: $n ms of latency on $net"
      sudo tc qdisc add dev "${br}" root netem delay ${n}ms
    fi
  fi
  N=$(expr $N + 100)
done
