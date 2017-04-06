#!/bin/bash
#set -v
echo "缩小图片大小以达到压缩图片文件大小目的"
read -p "请输入路径:" src
read -p "请输入每次缩小百分比（越小越精确）:" rate
ll=`ls -l $src | awk '{if ($5 > 10000000) print $5}' | wc -l`
while (($ll > 0))
do
    echo "正在转换文件数量:"$ll
    for i in `ls $src`
    do
        size=`ls -l $src/$i |awk '{print $5}'`
        if [ $size -gt 10000000 ]
         #convert -resize 90%*90% $i $i
        then
            convert -resize $(( 100-$rate ))%x$(( 100-$rate ))% $src/$i $src/$i
        fi
    done
ll=`ls -l $src | awk '{if ($5 > 10000000) print $5}' | wc -l`
done


