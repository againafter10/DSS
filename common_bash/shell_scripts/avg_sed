echo "Enter number?";
read N;
sum=0;
for ((i=0;i<$N;i++))
do
read number;
sum=$(($sum + $number));
done
#printf "%.3f" $(echo "scale=10; $sum/$N" | bc -l)
printf "%.3f" $(echo $sum/$N|bc -l)
