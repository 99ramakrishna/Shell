#!/bin/bash
echo "Authentication Type"
select option in disk_spaces ping_servers key password  52.207.10.109_connect 54.86.37.79_connect  52.207.10.109_command
do
 case $option in
   key)
     echo "Enter the pemkey:  username@ip and command "
     read key username ip command
     ssh -i $key.pem  $username@$ip $command > $ip.txt
     if [ $? == 0  ]
     then
        echo "=========== Status ==========="
        cat %date:~4,2%.txt
     else
       echo  "fail something get wrong"
     fi
   ;;
   password )
     echo "Going to prepare"
   ;;
   54.86.37.79_connect )
        ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  ubuntu@54.86.37.79
   ;;
   52.207.10.109_connect )
        ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  centos@52.207.10.109
   ;;
   ping_servers )
        echo -e "Enter ips text file name with extension example.txt :  \c"
        read  filename
        while read  item
        do
          # user_ip=($item)
          # user=${user_ip[0]}
           ip=$item
           echo  "==================    $ip  =============================="
           ping  $ip  -c  5 > $ip.txt
           if [ $? == 0  ]
           then

              echo "==================== $ip  Succfully Running   =============="
              echo "$ip is Running"
              echo "  "
              echo " "
          else
              echo "======================  This  $ip is  Down  ============="
              echo "$ip is in Down"
              echo ""
              echo ""
           fi
           cat $ip.txt
           echo "====================== End $ip =================="
           echo " "
       done   <   $filename
   ;;
   disk_spaces )
        echo -e "Enter ips text file name with extension example.txt :  \c"
        read  filename
        while read  item
        do
           user_ip=($item)
           user=${user_ip[0]}
           ip=${user_ip[1]}
           echo  "==================    $ip  =============================="
           echo " "
           storage=($(ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  $user@$ip  "df -kh  | grep /dev/shm"))


           echo "===============  Storage =========================="                                                                                #    echo  "${storage[5]}  used space is ${storage[2]}"
           echo  "${storage[5]}  used space is ${storage[2]}"
           echo "=============================================="
           exit
      done  <  $filename
   ;;
   52.207.10.109_command )
        echo -e "Enter ips text file name with extension example.txt :  \c"
        read  filename
        while read  item
        do
           user_ip=($item)
           user=${user_ip[0]}
           ip=${user_ip[1]}
           echo  "==================    $ip  =============================="
           ping  $ip  -c  5 > $ip.txt
           if [ $? == 0  ]
           then
              echo "==================== $ip  Succfully Running   =============="
              echo "$ip is Running"
              echo "  "
              echo " "
              storage=($(ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  $user@$ip  "df -kh  | grep /dev/shm"))
              echo "===============  Storage =========================="
              echo  "${storage[5]}  used space is ${storage[2]}"
              echo ""
              echo "=============================================="
           else
              echo "======================  This  $ip is  Down  ============="
              echo "$ip is in Down"
              echo ""
              echo ""
           fi
	   cat $ip.txt
           echo "====================== End $ip =================="
           echo " "
       done   <   $filename
   ;;

   * )
       echo "The option selected not exist."
   ;;
 esac
done
