#! /bin/bash
#************************************************************************************************#
# Script: ebs_start    (64bit version - Inline with DMT)                                         #
# Usage : script to call ebs start for component EBS and its associated database                 #
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

#. ~oracle/demo.profile
. ~applmgr/profile.demo
export logfile=${DL}/ebs.log
newline="\n"
echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  |tee -a $logfile
echo -e $newline |tee -a $logfile

. /home/ads/bin/env.sh
${DEMO_HOME}/bin/ebs/ebs_status.sh

if [ $? -ne 0 ]
then
    echo "*****  Starting EBS  *****"|tee -a $logfile
    echo -e $newline |tee -a $logfile
    rm -fr $INST_TOP/ora/10.1.3/j2ee/oacore/persistence/*
    rm -fr $INST_TOP/ora/10.1.3/j2ee/oafm/persistence/*
    rm -fr $INST_TOP/ora/10.1.3/j2ee/forms/persistence/*
    COMMAND="/home/ads/bin/startall"
    ${COMMAND} >> $logfile
    COMMAND="/home/ads/bin/start/wf_mailer"
    ${COMMAND} >> $logfile
else
    echo -e $newline|tee -a $logfile
    echo "EBS Already Up"|tee -a $logfile
fi
echo -e $newline|tee -a $logfile
