#************************************************************************************************#
# Script: agent_status.sh   (64bit version - Inline with DMT)                                    #
# Usage : script to call ebs cloud control agent status for component EBS                        #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 11-MAR-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

#!/bin/bash
 ID=`id -u`

if [ ${ID} -ne 501 ]; then
        echo "This script should be run as applmgr user."
        exit
fi

. ~applmgr/profile.demo
. $DEMO_HOME/profiles/ebs/agent.profile
export logfile=${DL}/ebs.log
newline="\n"
echo -e $newline |tee -a $logfile
emctl status agent |tee -a $logfile
echo -e $newline |tee -a $logfile
