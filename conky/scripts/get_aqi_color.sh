#! /bin/sh

AQI=$(grep 'AQI ' /tmp/wu_polling.data | awk -F " " '{$1=$2=""; print $3}')
color='000000'

if [ -z $AQI ]
then
  exit 1
fi

# Colors got from : https://airvisual.com/air-quality/aqi
if [ $AQI -le 50 ]
then
  color='green'
elif [ $AQI -gt 50 ] && [ $AQI -le 100 ]
then  
  color='yellow'
elif [ $AQI -gt 100 ] && [ $AQI -le 150 ] 
then  
  color='orange'
elif [ $AQI -gt 150 ] && [ $AQI -le 200 ] 
then  
  color='red_1'
elif [ $AQI -gt 200 ] && [ $AQI -le 300 ] 
then  
  color='red_2'
elif [ $AQI -gt 300 ] && [ $AQI -le 500 ] 
then  
  color='red_3'
fi

echo -n "\${image $PWS_CLIENT_PROJECT_PATH/icons/aqi_${color}.png -p $1,$2 -s $3x$3}"
exit 0
