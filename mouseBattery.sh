#!/bin/sh

# LowBatteryNotificationPercentage=$(ioreg -l | grep -e '"LowBatteryNotificationPercentage"')
# LowBatteryNotificationPercentage=${LowBatteryNotificationPercentage##*=}
# echo $LowBatteryNotificationPercentage

BatteryPercent=$(ioreg -l | grep -e '"BatteryPercent"')
BatteryPercent=${BatteryPercent##*=}
# echo $BatteryPercent

if [ $BatteryPercent -lt 30 ]
then
  osascript -e "display notification \"还剩 $BatteryPercent%\" with title \"鼠标电量\""
fi
