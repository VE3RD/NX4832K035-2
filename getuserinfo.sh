#!/bin/bash

############################################################

#  Get Name From:                                          #

#  /usr/local/etc/stripped.csv using call sign or dgid     #

#   as key                                                 #

#  Pass call sign or dgid in $1                            #

#  Pass Field Number in $2                                 #

#                                                          #

#                                                          #

#  KF6S/VE3RD                                  2021-12-14  #

############################################################

set -o errexit

sudo mount -o remount,rw /


if [ -z "$2" ]; then

   echo "No,Params"

         exit

fi


call=$(echo "$1" | xargs)


mt=$(sudo sed -n '/'"$call"'/p' /usr/local/etc/stripped.csv | head -1)


if [ -z "$mt" ]; then

    echo "Not Found"

   exit

fi


Id=$(echo "$mt" | cut -d',' -f1)

Callt=$(echo "$mt" | cut -d',' -f2)

Name1=$(echo "$mt" | cut -d',' -f3)

Name2=$(echo "$mt" | cut -d',' -f4)

City=$(echo "$mt" | cut -d',' -f5)

State=$(echo "$mt" | cut -d',' -f6)

Country=$(echo "$mt" | cut -d',' -f7)


case "$2" in

"1")

echo "$Id"

;;

"2")

echo "$Callt"

;;

3)

echo "$Name1"

;;

4)

echo "$Name2"

;;

5)

echo "$City"

;;

6)

echo "$State"

;;

7)

echo "$Country"

;;

34)

echo "$Name1|$Name2"

;;

567)

echo "$City|$State|$Country"

;;

3567)

echo "$Name1|$City|$State|$Country"

esac
