#!/bin/bash
source  /etc/profile

tomcat_home=/data/tomcat/apache-tomcat-8080
SHUTDOWN=$tomcat_home/bin/shutdown.sh
STARTTOMCAT=$tomcat_home/bin/startup.sh
echo "关闭$tomcat_home"
$SHUTDOWN
#ps -ef |grep tomcat |grep $tomcat_home |grep -v 'grep'|awk '{print $2}'

#删除日志文件，如果你不先删除可以不要下面一行
#rm  $tomcat_home/logs/* -rf
#删除tomcat的临时目录
rm  $tomcat_home/work/* -rf

sleep 5
echo "启动$tomcat_home"
$STARTTOMCAT
#看启动日志
#tail -f $tomcat_home/logs/catalina.out
sleep 4


