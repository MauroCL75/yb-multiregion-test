#!/bin/bash

router="router"
Y=100
N=0
eths="eth0 eth1"
for myeth in $eths; do
	num=`docker exec -it $router cat /sys/class/net/$myeth/iflink`
	num=`echo $num | sed 's/[^0-9]*//g'`
	eth=`ip ad | grep $num | awk  '{print $2}' | sed 's/://g' | sed 's/\r$//'`
	n=$(($RANDOM%($Y+$N)))
	eth=`echo $eth | awk -F\@ '{print $1}'`
	echo "#$container ETH:$num $n ms of latency on $eth"
        sudo tc qdisc del dev ${eth} root netem delay 0ms
	sudo tc qdisc add dev "${eth}" root netem delay ${n}ms
	N=100
done

