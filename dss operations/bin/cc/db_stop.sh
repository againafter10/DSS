#************************************************************************************************#
# Script: db_stop      (64bit version - Inline with DMT)                                         #
# Usage : script to call db stop for component CC                                                #
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
echo -e $newline
. $DEMO_HOME/profiles/cc/db.profile
status=`ps -ef | grep 'tnslsnr' | grep -v grep | wc -l`>> $logfile
if [ $status -gt 0 ]
then
echo "***** Stopping Listener ******" |tee -a $logfile
echo -e $newline|tee -a $logfile
lsnrctl stop
for i in `ps -ef | grep 'tnslsnr' | grep -v grep | awk '{ print $2 }'`
do
kill -9 $i
done;
else
echo "Listener Already down"|tee -a $logfile
echo -e $newline|tee -a $logfile
fi
echo -e $newline|tee -a $logfile
status=`ps ux|grep -i pmon|grep -v grep|wc -l`
if [ $status -eq 1 ]
then
echo "***** Shutting Database ******"|tee -a $logfile
echo -e $newline|tee -a $logfile
sqlplus "/ as sysdba" <<EOF|tee -a $logfile
shutdown immediate;
exit;
EOF
echo -e $newline|tee -a $logfile
sleep 5

else
        echo "Database Already Down"|tee -a $logfile
	echo -e $newline
fi
