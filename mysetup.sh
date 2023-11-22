#/bin/sh

myip=`grep $HOSTNAME /etc/hosts | awk '{print $1}'`
echo $myip
bin/yugabyted start --base_dir=/mnt/volume --cloud_location=aws.eu-west-2.zone-a --advertise_address=$myip
