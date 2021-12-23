#!/bin/bash
############################################################
#  Get  Mode from /etc/mmdvmhost                           #
#                                                          #
#  Returns a Binary Coded Value                            #
#                                                          #
#  VE3RD                                      2021-12-20   #
############################################################
set -o errexit
set -o pipefail

function ysf2p25tg()
{
y1=$(sed -nr "/^\[Network]/ { :1 /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/p25gateway)
y2=$(sed -nr "/^\[Network]/ { :1 /^Startup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysfgateway)
echo "$y1"
echo "$y2"

}
ysf2p25tg
exit


#m1=$(sudo cat /etc/mmdvmhost | grep "\[D-Star\]" -A 1 | grep "Enable=" | cut -b 8-9)
m1=$(sed -nr "/^\[D-Star]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#m2=$(sudo cat /etc/mmdvmhost | grep "\[DMR\]" -A 1 | grep "Enable=" | cut -b 8-9)
m2=$(sed -nr "/^\[DMR]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#m3=$(sudo cat /etc/mmdvmhost | grep "\[System Fusion\]" -A 1 | grep "Enable=" | cut -b 8-9)
m3=$(sed -nr "/^\[System Fusion]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#m4=$(sudo cat /etc/mmdvmhost | grep "\[NXDN\]" -A 1 | grep "Enable=" | cut -b 8-9)
m4=$(sed -nr "/^\[NXDN]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#m5=$(sudo cat /etc/mmdvmhost | grep "\[P25\]" -A 1 | grep "Enable=" | cut -b 8-9)
m5=$(sed -nr "/^\[P25]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#m6=$(sudo cat /etc/mmdvmhost | grep "\[POCSAG\]" -A 1 | grep "Enable=" | cut -b 8-9)
m6=$(sed -nr "/^\[POCSAG]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

#######mt="$m1 + ($m2*2) + ($m3*4) + ($m4*8) + ($m5*16) + ($m6*32)"

if [ "$m1" == 1 ]; then
 mode1="D-Star "
fi
if [ "$m2" == 1 ]; then
 mode2="DMR "
fi
if [ "$m3" == 1 ]; then
 mode3="YSF "
fi
if [ "$m4" == 1 ]; then
 mode4="NXDN "
fi
if [ "$m5" == 1 ]; then
 mode5="P25 "
fi

if [ "$mode2" == "DMR " ]; then
  	addr=$(sed -nr "/^\[DMR Network]/ { :1 /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	if [ "$addr" == "127.0.0.1" ]; then
		mode2="$mode2""DMRGateway "
	fi
fi

mt1="$mode1""$mode2""$mode3""$mode4""$mode5"

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



mt2="$md1""$md2""$md3""$md4""$md5"



echo "$mt1""$mt2"





