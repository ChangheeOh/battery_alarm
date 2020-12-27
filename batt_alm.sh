#!/bin/bash

batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR > 1' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
echo $batt_stat

while true;
do
if [[ $batt_stat > 90 ]];
then
	echo "Fully charged"
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
	break
else
	echo "Charging in progress"
	sleep 30
	batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR > 1' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
	echo $batt_stat
fi
done

