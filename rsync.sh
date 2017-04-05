#!/bin/bash
name='/data/tomcat/hituAPP/'
ips="123.57.218.130 123.57.218.187 101.200.163.183 101.200.231.81 101.200.234.73 112.126.87.36 112.126.90.88 101.200.176.89 101.200.188.17"
for i in $ips
do
 echo /usr/bin/rsync -atrv --delete -e ssh $name root@$i:$name 
 /usr/bin/rsync -av --delete -e ssh $name root@$i:$name
done
