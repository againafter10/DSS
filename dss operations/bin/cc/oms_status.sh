#************************************************************************************************#
# Script: oms_status   (64bit version - Inline with DMT)                                         #
# Usage : script to call oms status for component CC                                             #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 21-APR-2012   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

#!/bin/bash

ID=`id -u`

if [ ${ID} = 0 ]; then
        echo "This script should be run as oracle user."
        exit
fi

export logfile=${DL}/cc.log
. $DEMO_HOME/profiles/cc/oms.profile

echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a $logfile
echo "****** Status of OMS *****" |tee -a $logfile
echo -e $newline|tee -a $logfile
emctl status oms |tee -a  $logfile

status=`emctl status oms|grep -i up|wc -l`
if [ $status -eq  2 ]; then
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo  "OMS Up and Running  " |tee -a $logfile
echo -e $newline |tee -a $logfile
fi
