#!/usr/bin/env bash
# Read from the file file.txt and print its transposed content to stdout.

ncol=`head -n1 filetranspose2.txt | wc -w`

for i in `seq 1 $ncol`
do
    echo `cut -d' ' -f$i filetranspose2.txt`
done
