#!/bin/bash
read -p "Enter the user name:" name
grep -w ^$name  /etc/passwd>/dev/null
res=$?
echo $res
if [ -z $name ] || [ $res -eq 0 ]
then
   echo "user $name found in the system. could not create..exiting"
else
   read -sp "enter the password " pass
   useradd $name
   echo "$name:$pass"|chpasswd
   echo -e "\nUser $name created..."
fi
#end
