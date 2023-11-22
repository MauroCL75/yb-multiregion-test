#/bin/sh
#container, zone: za2 b
. ./params
myip=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1`
echo $myip
docker exec -it $1 bin/yugabyted start --base_dir=/mnt/volume --join=za1 --cloud_location=aws.af-south-1.zone-$2  --fault_tolerance=$TOLERANCE --advertise_address=$myip; exit
