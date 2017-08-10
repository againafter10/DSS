export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/special/bin:/usr/local/zbin:/perl/bin:/home/ads/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin
#export PSEUDONYM=
export PS1="[\u@$PSEUDONYM($HOSTNAME) \W]\$"
export TMP=/tmp
#export ORACLE_HOSTNAME=oemcc12c01.oracleads.com
export DEMO_HOME=/dss/operations;           export DH=$DEMO_HOME
export DEMO_LOGS=${DEMO_HOME}/logs;    export DL=$DEMO_LOGS
export ORACLE_BASE=/app/oracle/product
export MW_HOME=$ORACLE_BASE/Middleware;  export MWH=$MW_HOME
export JAVA_HOME=$ORACLE_BASE/jdk1.6.0_26
export PATH=$JAVA_HOME/bin:$PATH
export ORACLE_TERM=xsun5
export ORATAB_LOC=/etc
export DISPLAY=:2.0
ulimit -c unlimited
ulimit -s 32768

alias profiles='cd /dss/operations/profiles/ebs1'
alias startup='cd /dss/operations/bin/ebs1'

export sysmanPwd=`cat $DEMO_HOME/refresh/.sysman/.password`
alias sysmanpwd='echo $sysmanPwd'
