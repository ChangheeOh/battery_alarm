#!/bin/bash

batt_stat=$(pmset -g ps | awk '{print $3}' | awk 'NR == 2' | sed -e 's/%/ /g' | sed -e 's/;/ /g')
ac_stat=$(pmset -g ac)
echo $batt_stat '%' $ac_stat $(date)

while true;
do
# If battery fully charged and the adaptor already detached, exit
if [[ ( $batt_stat -gt $2 ) && ( $ac_stat = 'No adapter attached.' ) ]];
then
	echo "Exit the battery alarm."
	say -v Samantha "Exit the battery alarm."
	say -v Samantha "Exit the battery alarm."
	break
fi

# if battery fully charged but adaptor still attached, warn me to detach tha adaptor.
if [[ ( $batt_stat -gt $2 ) && ( $ac_stat != 'No adapter attached.' ) ]];
then
	echo "Fully charged."
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
	say -v Samantha "Battery fully charged. Please turn off AC adaptor."
fi

# If the battery status is too low and the adaptor not yet attached, warn me to start charging.
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

