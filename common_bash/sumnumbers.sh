#!/usr/bin/env bash
echo "enter the limit to count sum"
read limit
sum = 0
for ((i=0;i<$limit+1;i++))
do
sum=$(($sum + $i))
done

echo "sum of first " $limit "numbers is" $sum