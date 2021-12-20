#!/bin/bash
############################################################
#  Set  Gateway Network ReWrite Rules in /etc/dmrgateway   #
#                                                          #
#                                                          #
#  VE3RD                                     2019-11-20    #
############################################################
set -o errexit
set -o pipefail

sudo mount -o remount,rw /
  echo "Param 1 $1 " > /home/pi-star/NWRules.txt
  echo "Param 2 $2 " >> /home/pi-star/NWRules.txt
  echo "Param 3 $3 " >> /home/pi-star/NWRules.txt
  echo "Param 4 $4 " >> /home/pi-star/NWRules.txt
  echo "Param 5 $5 " >> /home/pi-star/NWRules.txt


net="$1"
name="$2"
address="$3"
port="$4"
localp="$5"
passw="$6"
Id="$7"
TGR="$8"

if [ -z "$3" ]; then
        exit
	else

#           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"$2"'.=\).*/\1'"$3"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Name"'=\).*/\1'"$name"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Address"'=\).*/\1'"$address"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Port"'=\).*/\1'"$port"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Local"'=\).*/\1'"$localp"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Password"'=\).*/\1'"$passw"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"Id"'=\).*/\1'"$Id"'/m;P;d' /etc/dmrgateway
           sudo sed -i '/^\[/h;G;/DMR Network '"$1"'/s/\('"TGRewrite0"'=\).*/\1'"$TGR"'/m;P;d' /etc/dmrgateway
	echo "$name|$address|$port|$localp|$passw|$Id|$TGR" > /home/pi-star/NWRules.txt
else
  echo "No Params" > /home/pi-star/NWRules.txt
fi;
sudo mount -o remount,ro /

#Name
#Address
#Port
#Local
#Password
#ID
#TGRewrite0

