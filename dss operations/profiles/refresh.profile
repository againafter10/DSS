### TNS related ###
export ORACLE_HOME=/app/oracle/product/11.2.0/dbhome_1       export OH=$ORACLE_HOME
export ORACLE_SID=emrep
export ORATAB_LOC=/etc
export TNS_ADMIN=$ORACLE_HOME/network/admin
export JAVA_HOME=$ORACLE_HOME/jdk
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$ORACLE_HOME/ctx/lib
export PATH=$ORACLE_HOME/bin:$ORACLE_HOME/OPatch:$ORACLE_HOME/oui/bin:$PATH

### Demo Script related ###
export DEMO_HOME=/dss/operations
export DEMO_LOGS=$DEMO_HOME/logs
export sysmanPwd=`cat $DEMO_HOME/refresh/.sysman/.password`
alias sysmanpwd='echo $sysmanPwd'
