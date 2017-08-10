#!/bin/bash
#************************************************************************************************#
# Script: Resetpwd.sh                                                                            #
# Usage :  usage: Resetpwd.sh  hostname.oracleads.com                                            #
# This script is used to reset the password for demo users                                       #
# This script must be run as root                                                                #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 28-MAY-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#
ID=`id -u`
if [ ${ID} -ne 0 ] ; then
    echo "This script must be run as root."
    exit
fi


if [ $# -eq 0 ] ; then
echo "Usage: $0 {hostname}.oracleads.com"
exit 1
fi

. /dss/operations/profiles/refresh.profile 
export logfile=${DEMO_LOGS}/ResetPwd_$1.log
rm $logfile
touch $logfile
chmod 777 $logfile


case $1 in
'unit3516.oracleads.com')
        ### Reseting SYSADMIN Password for EBS
        COMMAND="${DEMO_HOME}/refresh/ResetSysadmin.sh unit3511.oracleads.com 01 sysadmin EBS_SYSADMIN_PASSWORD EBS $logfile "
        su - applmgr -c "${COMMAND}"
        exit
        ;;

'unit3511.oracleads.com')
	#. ~oracle/.bashrc
	### Reseting Password for demo user
	COMMAND="${DEMO_HOME}/refresh/UpdPwd $1 01 sysman CC_SUPERADMIN_PASSWORD EBS"
	echo $COMMAND
	su - oracle -c "${COMMAND}"
	exit
	;;


'unit3511.oracleads.com'|'unit4508.oracleads.com')
        #. ~oracle/.bashrc
        ### Reseting Password for demo user
        COMMAND="${DEMO_HOME}/refresh/UpdPwd_cust $1 01 sysman CC_SUPERADMIN_PASSWORD EBS"
        echo $COMMAND
        su - oracle -c "${COMMAND}"
        exit
        ;;


*)
	echo "Usage: $0 {hostname}.oracleads.com"
	exit 1

esac
