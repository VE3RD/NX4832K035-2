#!/bin/bash
############################################################
#  Get DMR Network from /etc/mmdvmhost                     #
#                                                          #
#                                                          #
#                                                          #
#                                                          #
#  KF6S                                        10-21-2020  #
############################################################
set -o errexit
set -o pipefail

#sudo cat /etc/ysfgateway | grep "\[Network\]" -A 7 | grep "Startup=" | cut -b 9-59
 sudo sed -n '/^[ \t]*\[Network\]/,/\[/s/^[ \t]*Startup[ \t]*=[ \t]*//p' /etc/ysfgateway
##[Network]
##Startup=YSF2P25

