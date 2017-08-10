#! /bin/bash
#************************************************************************************************#
# Script: db_status (64bit version - Inline with DMT)                                            #
# Usage : script to call db status  for component EBS                                            #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 11-MAR-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

ID=`id -u`

if [ ${ID} -ne 59 ]; then
        echo "This script should be run as oracle user."
        exit
fi

. ~oracle/demo.profile
export logfile=${DL}/ebs.log
newline="\n"
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a $logfile
echo "******  Status of EBS Listener  *****"
echo -e $newline |tee -a $logfile
. $DEMO_HOME/profiles/ebs/db.profile
lsnrctl status
echo -e $newline|tee -a $logfile
echo "****** Status of Database *****"
echo -e $newline |tee -a $logfile
sqlplus -s /nolog  << EOF | tee -a $logfile
connect /as sysdba;
set head off
 select sys_context('USERENV','INSTANCE_NAME') from dual;
exit;
EOF
echo -e $newline |tee -a $logfile
