# Read from the file file.txt and print its transposed content to stdout.
#ncol=`head -n1 filetranspose.txt | wc -w`
ncol=`head -n1 filetranspose2.txt | wc -w`
#echo $ncol
for i in `seq 1 $ncol`
do
   # echo `cut -d' ' -f$i filetranspose.txt`
    echo `cut -d' ' -f$i filetranspose2.txt`
done
