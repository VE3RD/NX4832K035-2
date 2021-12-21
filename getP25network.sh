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

#sudo cat /etc/p25gateway | grep "\[Network\]" -A 7 | grep "Static=" | cut -b 9-59
#        m2=$(sudo sed -n '/^[ \t]*\[Network '"$1"'\]/,/\[/s/^[ \t]*Static[ \t]*=[ \t]*//p' /etc/p25gateway)
        sudo sed -n '/^[ \t]*\[Network\]/,/\[/s/^[ \t]*Static[ \t]*=[ \t]*//p' /etc/p25gateway
 
##[Network]
##Startup=YSF2P25

