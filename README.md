# Sample battery alarm for macOS written in shell script

This is a simple shell script to check the battery status and inform it's fully charged.
It only uses macOS terminal and no additional installation required.
Just copy .sh file and run it.

```
e.g.
  ./batt_alm_all.sh 10 90 60
  
  # 10 : Threshold value for low battery alarm
  # 90 : Threshold value for full battery alarm
  # 60 : Update frequency in second
```

If you are using macOS, you can create a Automator application workflow to run the above shell script and register it into startup items.
It will be monitoring the battery status and repeatedly warns you charge or turn off your charging by voice.
