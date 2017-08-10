#************************************************************************************************#
# Script: sendmail.sh                                                                            #
# Usage : script to check the sendmail process which would trigger workflow startup for EBS      #
# Usage:                                                                                         #
# When          Who              What                                                            #
# ------------------------------------------------------------------                             #
# 24-MAY-2013   ARCHANA JOSHI    Initial Version                                                 #
#************************************************************************************************#
ID=`id -u`

if [ ${ID} -ne 0 ]; then
        echo "This script should be run as root user."
        exit
fi

chown -R support:dba /var/spool/mail/support
chown -R support:nogroup /var/spool/mail/imap.support
/etc/init.d/sendmail restart
