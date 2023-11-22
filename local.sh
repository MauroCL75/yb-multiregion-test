#!/bin/sh

servers="uk1 uk2 uk3 za1 za2 za3"

for container in $servers; do
	docker exec -it $container bin/yugabyted configure data_placement --base_dir=/mnt/volume --fault_tolerance=region; exit
done
