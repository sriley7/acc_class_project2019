#!/bin/bash
#Create gcloud vm & login to vm via ssh

#variables
VNAME=$1
ZONE=us-east1-c
PROJ=analog-marking-231617

#function to ssh into vm
function ssh_vm(){
#ssh into new vm
gcloud compute config-ssh;
#gcloud compute ssh $VNAME
ssh ${VNAME}.${ZONE}.${PROJ} 'uptime; curl ifconfig.co; w; whoami;';

}

#ensures vm name is entered
while [ -z $VNAME ]
do
   echo "No vm name entered. Please enter a vm-name..."
   read VNAME
done

#creates gcloud vm
gcloud compute --project=analog-marking-231617 instances create $VNAME --zone=$ZONE --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --metadata=startup-script=\#\!/bin/bash$'\n'\#Create\ gcloud\ vm\ \&\ login\ to\ vm\ via\ ssh$'\n'$'\n'\#variables$'\n'VNAME=\$1$'\n'ZONE=us-east1-c$'\n'PROJ=analog-marking-231617$'\n'$'\n'$'\n'\#This\ logs\ into\ the\ instance$'\n'gcloud\ compute\ --project\ \"analog-marking-231617\"\ ssh\ --zone\ \"us-east1-c\"\ \"test\"$'\n'$'\n'\#This\ installs\ Apache$'\n'sudo\ apt-get\ update\ \&\&\ sudo\ apt-get\ install\ apache2\ -y$'\n'$'\n'sleep\ 60s$'\n'\#this\ unzips\ the\ tar\ file$'\n'tar\ -xvf\ \*.tar$'\n'$'\n'\#this\ navigates\ to\ the\ folder\ name$'\n'cd\ GottaGitBetter$'\n'$'\n'\#this\ moves\ it\ to\ the\ root\ directory\ of\ the\ apache\ server$'\n'sudo\ cp\ -r\ \*\ /var/www/html --maintenance-policy=MIGRATE --service-account=449777236248-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=ubuntu-1604-xenial-v20190325 --image-project=ubuntu-os-cloud --boot-disk-size=200GB --boot-disk-type=pd-standard --boot-disk-device-name=$VNAME
#gcloud compute --project=$PROJ instances create $VNAME --zone=$ZONE --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=449777236248-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=ubuntu-1604-xenial-v20190325 --image-project=ubuntu-os-cloud --boot-disk-size=50GB --boot-disk-type=pd-standard --boot-disk-device-name=$VNAME
#this builds the old one
#gcloud compute --project=analog-marking-231617 instances create $VNAME --zone=$ZONE --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=449777236248-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=https-server --image=ubuntu-minimal-1804-bionic-v20190212 --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=$VNAME ;

#put in a sleep timer that should elliminate the need for the while loop below..but keeping it just in case.
sleep 60s
ssh_vm

while [ $? -gt 0 ] 
do
   ssh_vm echo "Working on establishing a secure connection.";
done

#uploads file (HW1.mp4.zip) to vm in home directory, this still doens't work, gotta find a way to ssh into the machine first.
gcloud compute scp ~/Downloads/react.tar ${VNAME}:~
#scp ~/Downloads/HW12.tar ${VNAME}:~

ssh test-react.us-east1-c.analog-marking-231617 'tar -xvf *.tar; cd react; sudo cp -r * /var/www/html'


echo "Script has finished running!"

#This logs into the instance
#gcloud compute --project "analog-marking-231617" ssh --zone "us-east1-b" "test"