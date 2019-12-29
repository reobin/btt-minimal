#!/bin/sh

#    ██████╗  █████╗ ████████╗████████╗███████╗██████╗ ██╗   ██╗
#    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗╚██╗ ██╔╝
#    ██████╔╝███████║   ██║      ██║   █████╗  ██████╔╝ ╚████╔╝ 
#    ██╔══██╗██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗  ╚██╔╝  
#    ██████╔╝██║  ██║   ██║      ██║   ███████╗██║  ██║   ██║   
#    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   

BATTERY_INFOS=`pmset -g batt | grep InternalBattery | grep -oE '[0-9]*%; .*;'`

# filter battery percentage
PERCENTAGE=`echo $BATTERY_INFOS | grep -oE '[0-9]*%'`

# filter battery status
STATUS=${BATTERY_INFOS#[0-9]*%; }
STATUS=${STATUS/;/}

if [[ $STATUS =~ "discharging" ]]
then
  STATUS_INDICATOR=""
else
  STATUS_INDICATOR="⌁ "
fi

echo "[$STATUS_INDICATOR$PERCENTAGE]"
