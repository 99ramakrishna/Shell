#!/bin/bash
echo "Authentication Type"
select option in key password  52.207.10.109_connect  52.207.10.109_command
do
 case $option in
   key)
     echo "Enter the pemkey:  username ip and command "
     read key username ip command
     ssh -i $key.pem  $username@$ip $command > stats.txt
     if [ $? == 0  ]
     then
        echo "=========== Status ==========="
        cat stats.txt
     else
       echo  "fail something get wrong"
     fi
   ;;
   password )
     echo "Going to prepare"
   ;;
   52.207.10.109_connect )
        ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  centos@52.207.10.109
   ;;
   52.207.10.109_command )
        echo -e "Enter the pemkey:  username@ip and command \c"
        read  command
        ssh -i  ansible-control.pem  -o StrictHostKeyChecking=No  centos@52.207.10.109 "$command" >  output.txt
        cat output.txt
   ;;
   * )
       echo "The option selected not exist."
   ;;
 esac
done
