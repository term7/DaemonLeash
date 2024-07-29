#!/bin/bash

#   Run LocalUnloadList.sh list once directly after startup (to make sure no Adobe Software has been started)
/Users/Shared/Enhancements/DaemonLeash/dynamiclist/LocalUnloadList.sh

#   Variable that checks for Adobe Software that has been started by the user:
ApplicationCheck() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|After Effects|Creative Cloud" > /dev/null
}

#   If Adobe Software that has been started by the user is running: wait for 60 seconds, then check again
#   If no Adobe Software that has been started by the user is running: terminate all Adobe Processes and repeat

while true
do
if ApplicationCheck
then
sleep 60
else
/Users/Shared/Enhancements/DaemonLeash/dynamiclist/LocalUnloadList.sh
fi
done
