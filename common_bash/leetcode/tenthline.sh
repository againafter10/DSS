#to print the tenth line of a file
if [ `cat $1|tr -s '\n'|wc -l` -gt 10 ];
then
  echo `cat $1|tr -s '\n'|head |tail -1`
fi
