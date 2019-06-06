#!/bin/bash


lastTimestamp=`mysql cflowd -u bsx -h 12.12.12.8 --password=bsx2ndfloor -e 'SELECT FROM_UNIXTIME(sessionStartTime,"%Y%m%d%H%i") FROM comprehensive ORDER BY ID DESC LIMIT 1' | sed -n 2p`

currentTimestamp=`date +%Y%m%d%H%M`

difference=$(($currentTimestamp-$lastTimestamp))


echo "Last Timestamp:    $lastTimestamp"
echo "Current Timestamp: $currentTimestamp"
echo "Difference:        $difference"


if [ $difference -gt 10000 ]; then
	echo "Sending Email Alert"
	mailx -s "BSXLOGGER ALERT" < email.txt "konrad.staniszewski@nokia.com" "shawn.eakins@nokia.com"
fi

