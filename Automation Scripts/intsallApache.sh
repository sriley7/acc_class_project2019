#!/bin/bash
#Create gcloud vm & login to vm via ssh

#variables
VNAME=$1
ZONE=us-east1-c
PROJ=analog-marking-231617


#This logs into the instance
gcloud compute --project "analog-marking-231617" ssh --zone "us-east1-c" "test"

#This installs Apache
sudo apt-get update && sudo apt-get install apache2 -y

sleep 120s
#this unzips the tar file
tar -xvf *.tar

#this navigates to the folder name
cd GottaGitBetter

#this moves it to the root directory of the apache server
sudo cp -r * /var/www/html