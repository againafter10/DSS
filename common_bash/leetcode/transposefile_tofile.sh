# Read from the file file.txt and print its transposed content to stdout.
ncol=`head -n1 $1 | wc -w`
transpose=$1"_t"
if [ -e $transpose ];
then
  rm $transpose
fi

for i in `seq 1 $ncol`
do
    str=`cut -d' ' -f$i $1`
    echo $str >> $transpose
done
