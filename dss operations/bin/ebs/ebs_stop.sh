#! /bin/bash
#************************************************************************************************#
# Script: ebs_stop     (64bit version - Inline with DMT)                                         #
# Usage : script to call ebs stop for component EBS and its associated database                  #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 11-MAR-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#


ID=`id -u`

if [ ${ID} -ne 0 ]; then
        echo "This script should be run as root user."
        exit
fi

. ~oracle/demo.profile
export logfile=${DL}/ebs.log
newline="\n"
echo -e $newline >> $logfile
echo -e $newline |tee -a  $logfile
echo `date` |tee -a  $logfile
echo -e $newline |tee -a $logfile

. /home/ads/bin/env.sh
$DEMO_HOME/bin/ebs/ebs_status.sh
if [ $? -eq 0 ]
then
    echo "*****  Stopping EBS  *****"|tee -a $logfile
    # Killing hanging webcache pids as oracle prior to calling stopall
    x=`ps -ef|grep -i webcache|grep -v grep| awk '{print $2}'`
    for p_id in $x
    do
    kill -9  $p_id
    done

    COMMAND="/home/ads/bin/stopall"
    ${COMMAND} >> $logfile

    # Killing pending runmobileserver process as oracle user
    x=`ps -ef|grep -i oracle|grep  runmobileserver|grep -v grep| awk '{print $2}'`
    for p_id in $x
    do
    kill -9  $p_id
    done

    # Killing pending java processes as oracle user
     x=`ps -ef|grep -i oracle|grep java|grep -v grep| awk '{print $2}'`
    for p_id in $x
    do
    kill -9  $p_id
    done

else
    echo "EBS Already Down"|tee -a $logfile
    echo -e $newline |tee -a $logfile
fi
echo -e $newline|tee -a $logfile
