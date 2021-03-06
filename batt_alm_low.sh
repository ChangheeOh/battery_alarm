#!/bin/bash

batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR == 2' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
echo $batt_stat $(date)

while true;
do
if [[ $batt_stat -lt 10 ]];
then
	echo "Battery is too low. Please charge it immediately."
	say -v Samantha "Battery is too low. Please charge it immediately."
	say -v Samantha "Battery is too low. Please charge it immediately."
	break
else
	echo "Keep using battery."
	sleep 30
	batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR == 2' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
	echo $batt_stat $(date)
fi
done

