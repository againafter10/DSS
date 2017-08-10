export DOMAIN_HOME=/app/oracle/product/Middleware_12.1.0.2.0/gc_inst/user_projects/domains/GCDomain/
export ORACLE_SID=Emrep
export ORACLE_HOME=$ORACLE_BASE/Middleware_12.1.0.2.0/oms
export WL_HOME=$ORACLE_BASE/Middleware_12.1.0.2.0/wlserver_10.3
export MODULES_DIR=$ORACLE_BASE/Middleware_12.1.0.2.0/modules
export CCRHOME=$ORACLE_HOME/ccr
alias htpd="cd /app/oracle/product/Middleware_12.1.0.2.0/gc_inst/WebTierIH1/config/OHS/ohs1"
alias actl="cd /app/oracle/product/Middleware_12.1.0.2.0/Oracle_WT/ohs/bin/"
alias gclogs="cd  /app/oracle/product/gc_inst/em/EMGC_OMS1/sysman/log"
alias alogs="cd /app/oracle/product/gc_inst/WebTierIH1/diagnostics/logs/OHS/ohs1"
export ORACLE_INSTANCE=/app/oracle/product/Middleware_12.1.0.2.0/gc_inst/WebTierIH1
export ORACLE_CONFIG_HOME=$ORACLE_INSTANCE
export PATH=$ORACLE_HOME/bin:$ORACLE_INSTANCE/bin:$CCRHOME/bin:$ORACLE_HOME/OPatch:$LD_LIBRARY_PATH:$ORACLE_INSTANCE/bin/opmnctl:$PATH
export ORACLE_TERM=xsun5
export ORATAB_LOC=/etc
export DISPLAY=:2.0
export PATH=$ORACLE_HOME/bin:$PATH
export wlst_home=/app/oracle/product/Middleware_12.1.0.2.0/wlserver_10.3/common
export emrep_domain=/app/oracle/product/gc_inst/user_projects/domains/GCDomain/
export node_manager=/app/oracle/product/Middleware_12.1.0.2.0/wlserver_10.3/server
export PATH=$ORACLE_HOME/bin:$node_manager/bin:$emrep_domain/bin:$wlst_home/bin:$DOMAIN_HOME/bin:$PATH
export SERVERS=/app/oracle/product/Middleware_12.1.0.2.0/gc_inst/user_projects/domains/GCDomain/servers/
export JAVA_HOME=/app/oracle/product/Middleware_12.1.0.2.0/jdk16/jdk

ulimit -c unlimited
ulimit -s 32768

