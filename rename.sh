#!/bin/bash
#批量修改文件夹下所有文件名，并按顺序排序（类似windows下，批量重命名）

#提示"请输入前缀"
read -p "请输入前缀:" name
read -p "请输入路径:" src

index=1

for i in `ls $src -a`

do
#echo $i
((index=index+1))
#echo $index

id=`echo $src/$i | awk -F "|" '{print $1}'`
filename=`echo $src/$i | awk -F "|" '{print $NF}'`
mv $filename $src/$name$index.jpg
done