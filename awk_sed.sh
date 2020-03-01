
************************************* AWK *****************************************
###  To open the file like 'cat' command ###########

------>>>>>>>>awk '{print$0}' filename.txt                     #i.e.  ls -lrth 

total 164K
-rw-r--r-- 1 rama rama  91K Oct 24  2013 us-500.txt
-rwxr-xr-x 1 rama rama  325 Feb 29 23:34 disk_size.sh
-rwxrwxrwx 1 rama rama   55 Feb 29 23:58 commands.txt
-rwxrwxrwx 1 rama rama   72 Mar  1 00:04 while_reverse.sh
drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Videos
drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Templates
drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Public
drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Pictures

##print the complete data with numbers like cat command.

------------>>>>>>>> ls -lrth | awk '{print NR,$0}'              # NR means number od records.
1 total 164K
2 -rw-r--r-- 1 rama rama  91K Oct 24  2013 us-500.txt
3 -rwxr-xr-x 1 rama rama  325 Feb 29 23:34 disk_size.sh
4 -rwxrwxrwx 1 rama rama   55 Feb 29 23:58 commands.txt
5 -rwxrwxrwx 1 rama rama   72 Mar  1 00:04 while_reverse.sh
6 drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Videos
7 drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Templates
8 drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Public
9 drwxr-xr-x 2 rama rama 4.0K Mar  1 11:18 Pictures

## to print complete perticuler coloms
----------------------->>>>ls -lrth | awk '{print$2,$5}'
rama 91K
rama 325
rama 55
rama 72
rama 4.0K
rama 4.0K
rama 4.0K
rama 4.0K
rama 4.0K

#####to enable numbering to coloms

-------> ls -lrth | awk '{print NR, $2,$4}'





sed -n 7,10p dfkh.sh------------------>. print 7 to 10 lines


sed '5!s/ham/cheese/' file.txt--------->Replace ham with cheese in file.txt except in the 5th line


sed -f script.sed file.txt--------->>>>Write all commands in script.sed and execute
sed 12,18d file.txt--------------->>>
sed 12,18d file.txt---------->Show all of file.txt except for lines from 12 to 18
sed -n 12,18p file.txt------>Show only lines 12-18 of file.txt
sed '$d' file.txt -------> Delete the last line
























