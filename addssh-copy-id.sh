#!/bin/bash

hosts="101.200.199.236 101.200.210.19 112.126.94.236 112.126.94.237 59.110.0.63 59.110.55.59"
for i in $hosts
do
 echo 设置$i
 ssh-copy-id -i ~/.ssh/id_rsa.pub root@$i
done
