#************************************************************************************************#
# Script: db_stop    (64bit version - Inline with DMT)                                           #
# Usage : script to call db start for component EBS                                              #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 11-MAR-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

#! /bin/bash
ID=`id -u`

if [ ${ID} -ne 59 ]; then
        echo "This script should be run as oracle user."
        exit
fi

. $HOME/demo.profile
export logfile=${DL}/ebs.log
newline="\n"
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a $logfile
. $DEMO_HOME/profiles/db.profile
ps -efww | grep tnslsnr | grep -v grep  >> $logfile
if [ $? -ne 0 ]
then
    echo "*****  Starting EBS listener  *****"|tee -a $logfile
    echo -e $newline |tee -a $logfile
    lsnrctl start|tee -a $logfile
else
    echo "Listener Already Up"|tee -a $logfile
    echo -e $newline |tee -a $logfile
fi
db_status=`ps ux|grep -i pmon|grep -v grep|wc -l`
if [ $db_status -ne 1 ]
then
echo "*****  Starting EBS Database  ******"|tee -a $logfile
echo -e $newline |tee -a $logfile
sqlplus "/ as sysdba" <<EOF|tee -a $logfile
startup;
exit;
EOF
echo -e $newline |tee -a $logfile

else
        echo "Database Already UP"|tee -a $logfile
	echo -e $newline |tee -a $logfile
fi
