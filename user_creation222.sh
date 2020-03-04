#!/bin/bash

echo -e "Enter Pem_Key file: \c "
read KEY
echo -e "Enter server_User_Name: \c "
read USER_NAME
echo -e "Enter server_Ip_Addr: \c "
read SERVER_IP
read -p "Enter local copy file name: " copy_file_name

#read -p "Enter target server IP : " server_User_Name

#ssh -i $KEY  -o StrictHostKeyChecking=No $USER_NAME@$SERVER_IP
scp -r $KEY $copy_file_name  $USER_NAME@$SERVER_IP:/home/centos

ssh -i $KEY  -o StrictHostKeyChecking=No $USER_NAME@$SERVER_IP "ls -l /home/centos"
ssh -i $KEY  -o StrictHostKeyChecking=No $USER_NAME@$SERVER_IP "./$copy_file_name"

