#************************************************************************************************#
# Script: ebs_status   (64bit version - Inline with DMT)                                         #
# Usage : script to call ebs status for component EB and its associated database                 #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 11-MAR-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#

#!/bin/bash

ID=`id -u`

if [ ${ID} -ne 0 ]; then
        echo "This script should be run as root user."
        exit
fi

. ~oracle/demo.profile
export logfile=${DL}/ebs.log

echo -e $newline >> $logfile
echo -e $newline |tee -a $logfile
echo `date`  | tee -a $logfile
echo -e $newline |tee -a $logfile

let failed=0;

. /home/ads/bin/env.sh

### Apache,Oacore,Oafm,forms Check,fndlibr ###

pcount=`ps -ef|grep -i applmgr|grep -i apache|wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS httpd UP" >> $logfile
else
echo "EBS httpd DOWN" >> $logfile
let failed=failed+1
fi

pcount=`ps -ef|grep -i applmgr|grep  "oracle.oc4j.instancename=oacore" |wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS oacore UP" |tee -a $logfile
else
echo "EBS oacore DOWN"|tee -a $logfile
let failed=failed+1
fi

pcount=`ps -ef|grep -i applmgr|grep  "oracle.oc4j.instancename=oafm" |wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS oafm UP" |tee -a $logfile
else
echo "EBS oafm DOWN " |tee -a $logfile
let failed=failed+1
fi

pcount=`ps -ef|grep -i applmgr|grep  "oracle.oc4j.instancename=forms" |wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS forms UP" |tee -a $logfile
else
echo "EBS forms DOWN"  |tee -a $logfile
let failed=failed+1
fi


pcount=`ps -ef|grep -i applmgr|grep  FNDLIBR|wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS  Concurent manager UP"  |tee -a $logfile
else
echo "EBS  Concurent manager DOWN"  |tee -a $logfile
let failed=failed+1
fi

pcount=`ps -ef |grep -i oracle|grep -i lsnr|wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS database listener  UP"  |tee -a $logfile
else
echo "EBS database listener DOWN"  |tee -a $logfile
let failed=failed+1
fi

pcount=`ps -ef |grep -i oracle|grep -i pmon|wc -l`
if [ $pcount -ge 1 ] ;
then
echo "EBS database UP"  |tee -a $logfile
else
echo "EBS database DOWN"  |tee -a $logfile
let failed=failed+1
fi


if [ $failed -eq 0 ]; then
echo "All Components Up and Running " |tee -a $logfile 
echo -e $newline |tee -a $logfile
exit 0
else 
echo "Some(All) Components not Up"  |tee -a $logfile
echo -e $newline |tee -a $logfile 
exit 1
fi

