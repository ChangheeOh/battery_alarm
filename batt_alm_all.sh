#!/bin/bash

batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR == 2' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
ac_stat=$(pmset -g ac)
echo $batt_stat '%' $ac_stat $(date)

while true;
do
if [[ ( $batt_stat -gt $2 ) && ( $ac_stat != 'No adapter attached.' ) ]];
then
	echo "Fully charged"
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
fi

if [[ ( $batt_stat -lt $1 ) && ( $ac_stat == 'No adapter attached.' ) ]];
then

	echo "Battery is too low. Please charge it immediately."
	say -v Samantha "Battery is too low. Please charge it immediately."
	say -v Samantha "Battery is too low. Please charge it immediately."
fi

sleep $3
batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR == 2' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
ac_stat=$(pmset -g ac)
echo $batt_stat '%' $ac_stat $(date)

done

