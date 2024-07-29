#!/bin/bash

/Users/Shared/Enhancements/DaemonLeash/dynamiclist/LocalUnloadList.sh

ApplicationCheck() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|After Effects|Creative Cloud" > /dev/null
}


while true
do
if ApplicationCheck
then
sleep 60
else
/Users/Shared/Enhancements/DaemonLeash/dynamiclist/LocalUnloadList.sh
fi
done
