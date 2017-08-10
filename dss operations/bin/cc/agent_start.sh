#************************************************************************************************#
# Script: agent_start  (64bit version - Inline with DMT)                                         #
# Usage : script to call  agent start  for component CC                                          #
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

. $DEMO_HOME/profiles/cc/agent.profile
agent_status=`$ORACLE_HOME/bin/emctl status agent | grep  -i not |wc -l` >> $logfile
        if [ $agent_status = 1 ]
        then
	echo "******* Starting CC Agent ******* "  | tee -a $logfile
	echo -e $newline |tee -a $logfile
        ${ORACLE_HOME}/bin/emctl start agent  | tee -a $logfile
	echo -e $newline  | tee -a $logfile
	echo "Agent Started"
        else
        echo -e $newline | tee -a $logfile
        echo "Agent already Up"  | tee -a $logfile
	echo -e $newline | tee -a $logfile
        fi
