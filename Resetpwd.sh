#!/bin/bash
#************************************************************************************************#
# Script: Resetpwd.sh                                                                            #
# Usage :  usage: ResetDemoPwd  hostname.oracleads.com                                           #
# This script is used to reset the password for em12c  demo users                                #
# This script must be run as root                                                                #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 14-JUN-2012   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#
ID=`id -u`
if [ ${ID} -ne 0 ] ; then
    echo "This script must be run as root."
    exit
fi

# ResetDemoPwd  is only relevant to oemcc12c01.oracleads.com
HOST=`hostname -f | cut -f1 -d.`
if [ "${HOST}" != "oemcc12c01" ] ; then
        echo "This script is only to be executed on oemcc12c01"
        exit
fi

if [ $# -eq 0 ]
then
echo "Usage: $0 {hostname}.oracleads.com"
exit 1
fi

. ~oracle/.bashrc
export logfile=${DL}/ResetPwd.log
rm $logfile

touch $logfile
chmod 666 $logfile
chown oracle:dba $logfile
now=`date`
#Reseting Password for CCM
COMMAND="${DEMO_HOME}/refresh/UpdPwd $1 01 sysman CC_PASSWORD APR"
echo $COMMAND
su - oracle -c "${COMMAND}"
now=`date`
echo "Completed password reset for  ${HOST} at ${now}" >> $logfile
exit

