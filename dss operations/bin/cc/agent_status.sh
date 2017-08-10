#************************************************************************************************#
# Script: agent_status (64bit version - Inline with DMT)                                         #
# Usage : script to call  agent status for component CC                                          #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 21-APR-2012   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

#! /bin/bash
ID=`id -u`

if [ ${ID} = 0 ]; then
        echo "This script should be run as oracle user."
        exit
fi
export logfile=${DL}/cc.log
. $DEMO_HOME/profiles/cc/agent.profile
newline="\n"

echo -e $newline |tee -a $logfile
echo -e $newline |tee -a $logfile
echo "****** Status of CC Agent *****" |tee -a $logfile
echo -e $newline |tee -a $logfile
emctl status agent |tee -a  $logfile
