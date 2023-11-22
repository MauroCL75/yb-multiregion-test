#/bin/sh
#container, zone: uk2 b
. ./params
myip=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1`
echo $myip
docker exec -it $1 bin/yugabyted start --base_dir=/mnt/volume --fault_tolerance=$TOLERANCE --join uk1 --cloud_location=aws.eu-west-2.zone-$2 --advertise_address=$myip; exit
