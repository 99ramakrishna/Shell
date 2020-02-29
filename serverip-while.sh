#!/bin/bash


while ping in  $(cat ips.txt)
do
  ping $ping -c  2
  if [ $?  == 0 ]
  then
     echo  " "
     echo  " "
     echo  "********** $ping  is  running ****************"
     echo  " "
     echo  " "
     echo  " "
     echo  " "
     echo  " "
     sleep 3
  else
     echo  " "
     echo  " "
     echo  "********* $ping  is  Down *********************"
     echo  " "
     echo  " "
     echo  " "
     echo  " "
     echo  " "
     sleep 3
  fi
done
