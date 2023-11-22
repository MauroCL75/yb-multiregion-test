#/bin/sh

myip=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' au`
echo $myip
docker exec -it au bin/yugabyted start --base_dir=/mnt/volume --cloud_location=aws.ap-southeast-2.zone-a --advertise_address=$myip --join=uk; exit
