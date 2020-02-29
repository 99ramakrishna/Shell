#!/bin/bash


craetfile=$1
if [ -f $craetfile ]
then
    echo "$craetfile is exited"
    ls -l $craetfile
    echo -e "change permissions (y/n) \c "
    read permission
    if [ $permission == "y" ]
    then 
        echo -e "give permissions? \c "
        read value
        chmod $value $craetfile
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
    echo "$craetfile is does not exist"
    sleep 2
    echo "$craetfile is creating"
    sleep 2
    touch $craetfile
    if [ $? == 0 ]
    then
        echo " $craetfile is succsefully from user"
        if [ -f $craetfile ]
        then 
           echo " $craetfile is existed"
           ls -l $craetfile
           echo -e "change permissions? (y/n) \c"
           read permission_value
           if [ $permission_value == "y" ]
           then
               echo -e "give permissions to $craetfile \c "
               read dist
               chmod $dist $craetfile
               echo "successfully changed given file permissions"
               sleep 2
               ls -l $craetfile
               sleep 2 
               echo "thank you"
           else
               echo "thank you"
           fi
     
        else
           echo "file was not created "
        fi
     else
          echo " command doesnt exicuted"
     fi
     
fi
