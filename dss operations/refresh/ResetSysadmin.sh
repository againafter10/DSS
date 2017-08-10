#!/bin/bash
#************************************************************************************************#
# Script: ResetSysadmin.sh                                                                       #
# Usage :  usage: ResetSysadmin.sh  <<logfile location>>                                         #
# This script is used to reset the password for sysadmin user                                    #
# This script must be run as applmgr                                                             #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 28-MAY-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#
ID=`id -u`
if [ ${ID} -ne 501 ] ; then
    echo "This script must be run as applmgr."
    exit
fi

export password=`cat /dss/operations/refresh/.sysman/.password`

### Reseting Password for SYSADMIN user
### $sysmanPwd is retrieved so that all demo users have the same password
which FNDCPASS >> $6

FNDCPASS apps/apps 0 Y system/manager user sysadmin $password
cat  L*log >> $6
count=`grep -i successfully L*log|wc -l`
if [ $count -eq 0 ]; then
echo "ERROR: Password reset for SYSADMIN user FAILED in FNDCPASS at `date`" |tee -a  $6
exit 1
else
node_association=$1
param_name=$4
demo_reference=$5

### Udating adsweb for parameter EBS_SYSADMIN_PASSWORD
sqlplus /nolog <<eof  >>$6
#conn adsweb_refresh/ref@(description=(address_list=(address=(protocol=TCP)(host=adsscan-adsweb-prod.oracleads.com)(port=1521)))(connect_data=(service_name=SE0002.oracleads.com)))
conn adsweb_refresh/ref@(DESCRIPTION=(ADDRESS=(PROTOCOL = TCP)(HOST = adsdx0011-vip.oracleads.com)(PORT = 1523))(ADDRESS = (PROTOCOL = TCP)(HOST = adsdx0012-vip.oracleads.com)(PORT = 1523))(LOAD_BALANCE = yes)(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = adswebap_adx.oracleads.com)))

set echo on;
set feed on;
update tds_demo_accounts set da_par_value = rtrim('${password}') where da_association = '${node_association}' and da_name = '${demo_reference}' and da_par_name = '${param_name}';
commit;
exit
eof
echo "Password reset for SYSADMIN user successfull at `date`" |tee -a $6
rm L*log
exit
fi

