#/bin/sh
. ./params
myip=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1`
uk1=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' uk1`
echo $myip $uk1
docker exec -it $1 bin/yugabyted start --base_dir=/mnt/volume --fault_tolerance=$TOLERANCE --cloud_location=aws.af-south-1.zone-$2 --join=$uk1 --advertise_address=$myip;  exit
