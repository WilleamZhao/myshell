#!/bin/bash
restart8081='/data/tomcat/restart8081.sh'
ips="112.126.82.206 123.57.218.187 101.200.163.183 101.200.231.81 101.200.234.73 112.126.87.36 112.126.90.88 101.200.176.89 101.200.188.17"
for i in $ips
do
 echo 重启$i+8081
 echo '$restart8081'
 ssh root@$i 'nohup sh /data/tomcat/restart8081.sh'
done
