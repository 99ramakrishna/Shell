#!/bin/bash
df -kh
echo -e "Enter the path : \c"
read  path
output=$(df -kh | grep $path)
arr=($output)
echo ${arr[4]}
if  [ ${arr[4]} -le 80%  ]
then
  echo  "${arr[0]}  is used by ${arr[4]} and used space is ${arr[2]} remaining sapace is ${arr[3]} " 
#    echo "yes true"
else
   echo "this dick is full"
fi

