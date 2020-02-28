#!/bin/bash


#serverip=$1 

echo   -e  "enterIp addr : \c "
read serverip

ping $serverip -c 2
if [ $? == 0  ]
then  
   echo "This $serverip is up"	
else 
   echo "This $serverip is down"	

fi   
