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
}

#ensures vm name is entered
while [ -z $VNAME ]
do
   echo "No vm name entered. Please enter a vm-name..."
   read VNAME
done

#creates gcloud vm
gcloud compute --project=$PROJ instances create $VNAME --zone=$ZONE --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=449777236248-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=ubuntu-1804-bionic-v20190429 --image-project=ubuntu-os-cloud --boot-disk-size=200GB --boot-disk-type=pd-standard --boot-disk-device-name=$VNAME

#put in a sleep timer that should elliminate the need for the while loop below..but keeping it just in case.
sleep 60s
ssh_vm

while [ $? -gt 0 ] 
do
   ssh_vm echo "Working on establishing a secure connection.";
done

#Send the script to the machine.
gcloud compute scp ~/Scripts/lamp.sh ${VNAME}:~

ssh ${VNAME}.${ZONE}.${PROJ} './lamp.sh'

#uploads file (HW1.mp4.zip) to vm in home directory, this still doens't work, gotta find a way to ssh into the machine first.
gcloud compute scp ~/Scripts/sites/SQLSecure.tar ${VNAME}:~


#moves junk to the root directory
ssh ${VNAME}.${ZONE}.${PROJ} 'tar -xvf *.tar; cd SQLSecure; sudo cp -r * /var/www/html'

#gets the external ip and stores it to a file.
ssh ${VNAME}.${ZONE}.${PROJ} 'curl -H "Metadata-Flavor: Google" http://metadata/ca/v1/instance/network-interfaces/0/access-configs/0/external-ip > outphp.txt'

#downloads the file to the local host.
gcloud compute scp --recurse ${VNAME}:/home/user/outphp.txt /home/user/Scripts/outputIP

echo "Script has finished running!"



