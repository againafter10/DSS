#cat ~/.bash_history|head |tail -1
clear
count=$((`cat file.txt|wc -l`))
if [ $count -gt 9 ]
then
head file.txt|tail -1
exit 0
fi
exit 1
