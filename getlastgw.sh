#!/bin/bash
#################################################
#  Get Last Heard Network from DMRGateway	#
#						#
#						#
#  VE3RD 			2020-11-29	#
#################################################
set -o errexit
set -o pipefail

function getstring
{
# Step 1 - Get newest dmrgateway log file

	f1=$(ls -art /var/log/pi-star/DMRG* | tail -n1)
#	echo "File: $f1"

# Step 2 - Get the last line that contains 'transmission'
	line=$(grep transmission $f1 | tail -n 1)
#	echo "1:$line"

# Step 3 - Get Param 4 to Determine RF or Network
	type=$(echo "$line" | cut -d' ' -f4)
#	echo "type=$type"


# Step 4 Get Network Name and Number

#	if [ "$type" = "RFRX" ]; then
#		tt1=$(echo "$line" | cut -d' ' -f6 | cut -d'=' -f2)     # Net Number
#		tt2=$(echo "$line" | cut -d' ' -f11 | cut -d'=' -f2)     # DMRId
#		echo "GW R Net $tt1 $tt2" 
		
#	fi

#	if [ "$type" = "NetRX" ]; then
		t1=$(echo "$line" | cut -d' ' -f6 | cut -d'=' -f2)      #Net Number
		t2=$(echo "$line" | cut -d' ' -f11)	#DMR Id
		t3=$(echo "$line" | cut -d' ' -f13)	#TG
#		echo "GW N Net $t1 $t2"
#	fi
# Step 5 Get user Call & name
     call=$(grep "$t2" /usr/local/etc/stripped.csv | cut -d "," -f2)
     name=$(grep "$t2" /usr/local/etc/stripped.csv | cut -d "," -f3)
echo "GW $t1 $type $t2 $call" "$name $t3"

}

Addr=$(sed -nr "/^\[DMR Network\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/mmdvmhost)

#Check to see if we are running the DMRGatewy
if [ $Addr = "127.0.0.1" ]; then
 	GW="ON"
	getstring
else
   	# We are not Running the Gateway - Do Nothing
	GW="OFF"
fi

