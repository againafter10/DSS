files=`ls *.scala`
for i in $files
do
echo $i
command="cp "$i" "$i"_bak"
 echo `$command`
done
