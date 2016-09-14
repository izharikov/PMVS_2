#!/bin/sh
url=$(cat ./weather.ini | grep -oP  'url=\K.*')
timeout=$(cat ./weather.ini | grep -oP  'timeout=\K.*')s
while true;
do
	content=$(wget $url -q -O -)
	echo $content | grep -oP 'Температура \K[\+|\-]{0,1}\d+\.\d+' | head -1
	sleep $timeout
done
