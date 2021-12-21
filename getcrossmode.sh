#!/bin/bash
############################################################
#  Get Cross Mode 			                   #
#  Build Binary Bit Pattern                                #
#                                                          #
#  Returns a number as a string		                   #
#                                                          #
#  VE3RD                                        2019-11-14 #
############################################################
set -o errexit
set -o pipefail

m1=$(sed -nr "/^\[Enabled\]/ { :1 /^Enabled[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/dmr2ysf)
m2=$(sed -nr "/^\[Enabled\]/ { :1 /^Enabled[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/dmr2nxdn)
m3=$(sed -nr "/^\[Enabled\]/ { :1 /^Enabled[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysf2dmr)
m4=$(sed -nr "/^\[Enabled\]/ { :1 /^Enabled[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysf2nxdn)
m5=$(sed -nr "/^\[Enabled\]/ { :1 /^Enabled[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysf2p25)
if [ "$m1" == 1 ]; then
 md1="DMR2YSF"
fi
if [ "$m2" == 1 ]; then
 md2="DMR2NXDN"
fi
if [ "$m3" == 1 ]; then
 md3="YSF2DMR"
fi
if [ "$m4" == 1 ]; then
 md4="YSF2NXDN"
fi
if [ "$m5" == 1 ]; then
 md5="YSF2P25"
fi

mt="$md1""$md2""$md3""$md4""$md5"

echo "$mt"


