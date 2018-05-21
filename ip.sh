#!/bin/bash
# 获取IP地址
# get IP
function myip(){
  myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
  lanip="$(echo $myip | awk '{print $2}')"
  publicip="$(echo $myip | awk '{print $6}')"
  echo '你的局域网IP是: '$lanip
  echo '你的外网IP是: '$publicip
  # echo '复制到剪贴板' $lanip | pbcopy
}

myip;
