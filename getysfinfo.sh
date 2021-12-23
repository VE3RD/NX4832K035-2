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

startup=$(sed -nr "/^\[Network]/ { :1 /^Startup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysfgateway)
y1="$startup"

case "$startup" in

  YSF2DMR)
	y2=$(sed -nr "/^\[DMR Network]/ { :1 /^StartupDstId[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/ysf2dmr)
    	;;

  YSF2NXDN)
	y2=$(sed -nr "/^\[Network]/ { :1 /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/nxdngateway)
    ;;

  YSF2P25)
	y2=$(sed -nr "/^\[Network]/ { :1 /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/p25gateway)
    ;;

  *)
	y1="YSF"
	y2="$startup"
    ;;
esac


echo "$y1 $y2"








