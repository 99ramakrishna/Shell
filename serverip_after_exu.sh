#!/bin/bash

add=172.217.174
for ping in   {174..200..1}
do
  ping $add.$ping -c  2
  if [ $?  == 0 ]
  then
     echo  "$add.$ping  is  running"
  else
    echo  "$add.$ping  is  Down"
  fi
done
