#!/usr/bin/env bash
echo "Enter 3 sides of the triangle os 3 separate lines"
read a
read b
read c
if [ $a == $b ]  &&  [ $b == $c ]
then
printf "EQUILATERAL"

elif [ $a == $b ] || [ $b == $c ] || [ $a == $c ]
then
printf "ISOSCELES"
else
printf "SCALENE"
fi

