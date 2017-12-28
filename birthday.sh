#!/bin/bash
# Program:
#   Tell you how many days you have birthday.
# History:
# 2017/12/28    Yibangyu   First release
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
export PATH

echo "Tell you how many days you have birthday"
read -p "Please input your birthday(MMDD ex > 0227):" birthday

if [[ ! ${birthday} =~ ^[0-9]{4}$ ]];then
    echo "Your input is not compliant"
    exit 1
fi

year=$(date +%Y)
Thisbirthday=$(date --date="${year}${birthday}" +%s)
now=$(date +%s)


if [ ${Thisbirthday} -gt ${now} ];then
    timediff=$((${Thisbirthday}-${now}))
else
    Nextbirthday=$(date --date="$((${year}+1))${birthday}" +%s)
    timediff=$((${Nextbirthday}-${now}))
fi

echo "$((${timediff}/(60*60*24))) days before your next birthday"
