#!/bin/bash

echo -e "Enter Pem_Key file: \c "
read KEY 
echo -e "Enter server_User_Name: \c "
read USER_NAME 
echo -e "Enter server_Ip_Addr: \c "
#read -p "Enter server_IP_Addr: " SEVER_IP
read SERVER_IP
read -p "Enter local copy file name: " copy_file_name

#read -p "Enter target server IP : " server_User_Name

scp -r $KEY $copy_file_name  $USER_NAME@$SERVER_IP:/home/centos

ssh -i $KEY  -o StrictHostKeyChecking=No $USER_NAME@$SERVER_IP "ls -l /home/centos"
ssh -i $KEY  -o StrictHostKeyChecking=No $USER_NAME@$SERVER_IP "./$copy_file_name"

if [ $? == 0 ]
then 
   echo "successfully loged into :$SERVERip"
   clear
   echo "present working directory is: $($PWD)"
   cp $copy_file_name /root/
   echo "Current UserName is : ($(whoami))"                                   
   echo "Successfully enter into root_user: ($(sudo -i))"
   echo "Current UserName is : ($(whoami))"
   echo "Current OS and Version is: ($(lsb_release -d))"
   #read packagemager 
   echo "Packages are updatding: "
       sudo yum update -y
   echo "packages are installing:"
       sudo yum install vim wget sudo curl -y 
   echo "Creating User for automation:"
   echo -e "Enter remote_new_username: \c "
       read remote_new_user
       useradd -m -d /home/$remote_new_user   -s /bin/bash  $remote_new_user
       if [ $? == 0]
       then
	    echo "Entered user is successfully craeted"
            echo "Create new password to $remote_new_user:"
	    read remote_new_user_password
	    echo "$remote_new_user:$remote_new_user_password" | chpasswd
            echo "to give sudo permission to $remote_new_user"

	    

       else
	    echo "User was not craeted "
       fi
else
   echo "You Entered credentials were Wrong"
fi
