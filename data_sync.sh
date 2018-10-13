#!/bin/bash

while true; do
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Online"
    #ntpdate -u pool.ntp.org
    sudo ntpdate -u clock.stdtime.gov.tw
    break
else
    echo "Offline"
fi
done

