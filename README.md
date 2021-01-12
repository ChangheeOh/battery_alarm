# Sample battery alarm for macOS written in shell script

This is a simple shell script to check the battery status and inform it's fully charged.
It only uses macOS terminal and no additional installation required.
Just copy .sh file and run it.

```
# e.g.
  ./batt_alm_all.sh 10 90 60
  
  # 10 : Threshold value for low battery alarm
  # 90 : Threshold value for full battery alarm
  # 60 : Update frequency in second
```

If you are using macOS, you can create a Automator application workflow to run the above shell script and register it into startup items.
It will be monitoring the battery status and repeatedly warns you charge or turn off your charging by voice.

```
# Create a symbolic link to execute the shell srcipt anywhere.
ln -s /Library/Services/batt_alm_all.sh /usr/local/bin/batt_check

# Add the following command in 'Run a Shell Script' action.
# After run the following command, 'ScriptMonitor' will be displayed in the menu bar and you can stop it, if it's required.
batt_check 10 90 60&
```

__I found that if this shell script runs all the time, it could make battery consumed faster. To use this in everyday life, needs be improved.__
