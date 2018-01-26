#!/bin/bash

clear
ip=$1
a=100
b=""

while true
do

png_out=$(ping -c 1 -w 1 -W 1 $ip)

if [[ "$png_out" =~ " 0% packet loss" ]]
then

png_out=${png_out#*time}
png_out=${png_out#*=}
png_out=${png_out%%ms*}
png_out=${png_out%%.*}

if (( "$png_out" > "$a" ));
then

echo -ne "\nAttn: Slow response!"
b="\n"
else
echo -ne "$b"
#echo "$png_out"
echo -ne "!"
b=""
fi
fi

if [[ "$png_out" =~ "100% packet loss" ]]
then

echo -ne "\nWarning: Ping failed!"
b="\n"

fi
done

