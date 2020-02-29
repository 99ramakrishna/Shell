#!/bin/bash


craetdir=$1
if [ -d $craetdir ]
then
    echo "$craetdir is exited"
    ls -l $craetdir
    echo -e "change permissions (y/n) \c "
    read permission
    if [ $permission == "y" ]
    then 
        echo -e "give permissions? \c "
        read value
        chmod $value $craetdir
        if [ $? == 0 ] 
        then 
            echo "permissions successfully changed from user"
        else
            echo "somthing went wrong "
        fi
     else
        echo " thank you"
     fi
else 
    echo "$craetdir is does not exist"
    sleep 2
    echo "$craetdir is creating"
    sleep 2
    mkdir $craetdir
    if [ $? == 0 ]
    then
        echo " $craetdir is succsefully from user"
        if [ -d $craetdir ]
        then 
           echo " $craetdir is existed"
           ls -l $craetdir
           echo -e "change permissions? (y/n) \c"
           read permission_value
           if [ $permission_value == "y" ]
           then
               echo -e "give permissions to $craetdir \c "
               read dist
               chmod $dist $craetdir
               echo "successfully changed given directory permissions"
               sleep 2
               ls -l $craetdir
               sleep 2 
               echo "thank you"
           else
               echo "thank you"
           fi
     
        else
           echo "directory was not created "
        fi
     else
          echo " command doesnt exicuted"
     fi
     
fi
  
