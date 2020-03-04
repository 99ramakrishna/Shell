for host in $HOST_LIST; 
do
    ssh $host "passwd -p 'encrypted_passwd' user"
done
