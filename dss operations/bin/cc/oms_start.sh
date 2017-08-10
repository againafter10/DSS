#************************************************************************************************#
# Script: oms_start    (64bit version - Inline with DMT)                                         #
# Usage : script to call oms start for component CC                                              #
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
newline="\n"
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a  $logfile
. $DEMO_HOME/profiles/cc/oms.profile
oms_status=`$ORACLE_HOME/bin/emctl status oms | grep  -i up |wc -l` >> $logfile
        if [ $oms_status -lt 2 ]
        then
	echo "******* Starting CC OMS   ******* " | tee -a $logfile
	echo -e $newline |tee -a $logfile
        ${ORACLE_HOME}/bin/emctl start oms | tee -a $logfile
	echo -e $newline|tee -a $logfile
	echo "OMS Started"
	echo -e $newline |tee -a $logfile
        else
        echo -e $newline|tee -a $logfile
        echo "OMS already Up"  | tee -a $logfile
	echo -e $newline|tee -a $logfile
        fi
