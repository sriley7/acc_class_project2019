#!/bin/bash
#Create gcloud vm & login to vm via ssh

#variables
VNAME=$1
ZONE=us-east1-b
PROJ=marine-lodge-231617

#function to ssh into vm
function ssh_vm(){
#ssh into new vm
gcloud compute config-ssh;
#gcloud compute ssh $VNAME
ssh ${VNAME}.${ZONE}.${PROJ} 'uptime; curl ifconfig.co; w; whoami;';
#ssh ${VNAME}.${ZONE}.${PROJ}
}

#ensures vm name is entered
while [ -z $VNAME ]
do
   echo "No vm name entered. Please enter a vm-name..."
   read VNAME
done

#creates gcloud vm
gcloud compute --project=marine-lodge-231617 instances create $VNAME --zone=$ZONE --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=333591212860-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=https-server --image=ubuntu-minimal-1804-bionic-v20190212 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=$VNAME ;

ssh_vm

while [ $? -gt 0 ] 
do
   ssh_vm echo "Working on establishing a secure connection.";
done

#uploads file (HW1.mp4.zip) to vm in home directory
gcloud compute scp ~/Downloads/HW1.mp4.zip ${VNAME}:~
echo "Script has finished running!"
