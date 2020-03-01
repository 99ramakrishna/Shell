#!/bin/bash
df -kh
echo -e "Enter disk mount on :  \c"
read mountpath
mountpathdir=$(df -kh | grep $mountpath)
arry=($mountpathdir)
echo ${arry[4]}
if [ ${arry[4]} \< 40% ]
then
   echo " ${arry[0]} is used by ${arry[4]} that is ${arry[2]} and remainig availabe sapce is ${arry[3]}"
else
   echo "${arry[0]} disk is full"
fi
