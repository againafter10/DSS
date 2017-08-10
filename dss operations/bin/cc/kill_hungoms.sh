while $count [ `ps -ef | grep EMGC_ADMINSERVER |grep -v grep|wc -l` -gt 0 ]
do
array=(`ps -ef | grep EMGC_ADMINSERVER |grep -v grep|awk '{print $2}'`)
for i in "${array[@]}"
do
kill -9 $i
done
done

echo "EMGC_ADMINSERVER DOWN"

while $count [ `ps -ef | grep EMGC_OMS1 |grep -v grep|wc -l` -gt 0 ]
do
array=(`ps -ef | grep EMGC_OMS1 |grep -v grep|awk '{print $2}'`)
for i in "${array[@]}"
do
kill -9 $i
done
done

echo "EMGC_OMS1 DOWN"

while $count [ `ps -ef | grep oms |grep -v grep|wc -l` -gt 0 ]
do
array=(`ps -ef | grep oms |grep -v grep|awk '{print $2}'`)
for i in "${array[@]}"
do
echo $i
kill -9 $i
done
done

echo "oms1 DOWN"


cd /app/oracle/product/Middleware_12.1.0.2.0/gc_inst/user_projects/domains
find . -name "*.lok" >> remove_locks
echo "locks found"
for i in remove_locks
do
rm $i
done
rm  remove_locks
echo "Locks Removed"
