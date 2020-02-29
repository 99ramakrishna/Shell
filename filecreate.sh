#!/bin/bash

file=$1

if [ -f $file ]
then 
    echo "*************** $file is exited ********************"
    
else
    touch $file
    if [ $? == 0  ]
    then
        echo  "************ $file created successfully ************"
        if [ -f $file ]
        then
           echo "$file is existed after created"
        else
           echo "something went wrong"
        fi
    else
        echo "*****somthing went wrong**********"
    fi
fi
