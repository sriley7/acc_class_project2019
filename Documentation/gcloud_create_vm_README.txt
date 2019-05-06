gcloud_create_vm.sh operation & usage:

1.script requires name you want to give vm as an argument;
2.script can be reused by anyone ,but it requires you to rename PROJ variable (changing ZONE variable is optional);
3.after vm is created, the script tries to establish a connection to vm until one is made
4.in order to upload needed files to vm change the second to last line to the files you want to include
5.the script runs uptime, curl, & whoami commands on vm to check functionallity
