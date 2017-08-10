#************************************************************************************************#
# Script: db_start     (64bit version - Inline with DMT)                                         #
# Usage : script to call db start for component CC                                               #
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
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a $logfile
. $DEMO_HOME/profiles/cc/db.profile
ps -efww | grep tnslsnr | grep -v grep  >> $logfile
if [ $? -ne 0 ]
then
    echo "***** Starting listener *****"|tee -a $logfile
    echo -e $newline |tee -a $logfile
    lsnrctl start|tee -a $logfile
else
    echo "Listener Already Up"|tee -a $logfile
    echo -e $newline |tee -a $logfile
fi
echo -e $newline
db_status=`ps ux|grep -i pmon|grep -v grep|wc -l`
if [ $db_status -ne 1 ]
then
echo "***** Starting Database ******"|tee -a $logfile
echo -e $newline |tee -a $logfile
sqlplus "/ as sysdba" <<EOF|tee -a $logfile
startup;
exit;
EOF

else
	echo "Database Already UP"|tee -a $logfile
	echo -e $newline |tee -a $logfile
fi

