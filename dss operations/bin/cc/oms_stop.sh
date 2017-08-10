#************************************************************************************************#
# Script: oms_stop     (64bit version - Inline with DMT)                                         #
# Usage : script to call oms stop for component CC                                               #
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
echo -e $newline |tee -a $logfile
echo -e $newline >> $logfile
. $DEMO_HOME/profiles/cc/oms.profile
agent_status=`$ORACLE_HOME/bin/emctl status oms | grep  -i up |wc -l` >> $logfile
        if [ $agent_status -ge 1 ]
        then
	echo "******* Stopping CC OMS   ******* " | tee -a $logfile
	echo -e $newline |tee -a $logfile
        ${ORACLE_HOME}/bin/emctl stop oms -all  | tee -a $logfile
	echo -e $newline  | tee -a $logfile
	$DEMO_HOME/bin/cc/kill_hungoms.sh  | tee -a $logfile
	echo "OMS Shutdown"
	echo -e $newline |tee -a $logfile
        else
        echo -e $newline  | tee -a $logfile
        echo "OMS already Down"  | tee -a $logfile
	echo -e $newline  | tee -a $logfile
        fi
