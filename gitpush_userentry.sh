#!/bin/bash

#filename=$1
#branchname=$2
#flag=$3
#commitmsg=$4


echo -e " Enter filename/. baranchname flag(-m -am -amend ) commitmsg  \c"
read filename branchname flag commitmsg 



if [[ -f $filename || -d $filename ]]
then
   git add $filename
    
   if [ $? == 0  ]
   then 
     
      git status
      if [ $? == 0 ]
      then 
	 echo "*********************************  successfully added *************************"     

	 git commit $flag  "$commitmsg"
         echo "********************************* successfully commited **********************"
	 git config credential.helper store

	 git push origin $branchname
         
	
	 
      else
         echo "something went wrong"	      
      fi	 

   else 
      echo "something went wrong"   

   fi
else 
   echo "$filename is not found"
fi
