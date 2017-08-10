#************************************************************************************************#
# Script: db_status    (64bit version - Inline with DMT)                                         #
# Usage : script to call db status for component CC                                              #
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
echo "****** Status of Listener *****" | tee -a $logfile
echo -e $newline | tee -a $logfile
. $DEMO_HOME/profiles/cc/db.profile
lsnrctl status|tee -a $logfile
echo -e $newline|tee -a $logfile
echo "****** Status of Database *****"
echo -e $newline|tee -a $logfile
sqlplus -s /nolog  << EOF | tee -a $logfile
connect /as sysdba;
set head off
 select sys_context('USERENV','INSTANCE_NAME') from dual;
exit;
EOF
echo -e $newline|tee -a $logfile
