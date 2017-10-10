# Read from the file file.txt and print its transposed content to stdout.
ncol=`head -n1 $1 | wc -w`
for i in `seq 1 $ncol`
do
    echo `cut -d' ' -f$i $1`
done
