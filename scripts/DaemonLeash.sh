#!/bin/bash

#   First DaemonLeash clears the old unload command list of Adobe/Google LaunchDaemons and LaunchAgents.
sed -i '' /com.adobe.*/d /opt/daemonleash/dynamiclist/LocalUnloadList.sh;
sed -i '' /com.google.*/d /opt/daemonleash/dynamiclist/LocalUnloadList.sh;
sed -i '' /com.adobe.*/d /opt/daemonleash/dynamiclist/GlobalUnloadList.sh;
sed -i '' /com.google.*/d /opt/daemonleash/dynamiclist/GlobalUnloadList.sh;

#   Next it fills the two unload command lists again with all Adobe/Google Launch Daemons and LaunchAgents.
find /Library/LaunchDaemons \( -name "com.adobe.*" \) | sed 's/^/sudo launchctl unload /' >> /opt/daemonleash/dynamiclist/GlobalUnloadList.sh;
find /Library/LaunchDaemons \( -name "com.google.*" \) | sed 's/^/sudo launchctl unload /' >> /opt/daemonleash/dynamiclist/GlobalUnloadList.sh;
find /Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> /opt/daemonleash/dynamiclist/LocalUnloadList.sh;
find /Users/bleeeth/Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> /opt/daemonleash/dynamiclist/LocalUnloadList.sh;
find /Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> /opt/daemonleash/dynamiclist/LocalUnloadList.sh;
find /Users/bleeeth/Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> /opt/daemonleash/dynamiclist/LocalUnloadList.sh;

#   Because this script is started and owned by root it can now also unload all LaunchDaemons

/opt/daemonleash/dynamiclist/GlobalUnloadList.sh

#   Next we define the functions that check for running processes. Please note: we have split each function in two functions. We decided to do this because it makes it possible to write the readout of one function to the log file and use the other function to tell the sript that processes are running.
#   1) We need two functions for all active apps that are in use.
#   2) We need two functions for all background apps that we want to terminate.
#   3) We need one exeption for Creative Cloud. Sometimes we want to update our Adobe Applications, but if we keep to terminate all background processes, Creative Cloud will just crash which makes it impossible for us to install updates.

ApplicationLog() {
ps cax | grep -v grep | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|After Effects"
}
ApplicationCheck() {
ApplicationLog > /dev/null
}
BackgroundLog() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "AdobeCRDaemon|Adobe Desktop Service|Core Sync|Adobe CCXProcess|node|Adobe_CCXProcess.node|AdobeIPCBroker|LogTransport2|AdobeResourceSynchronizer"
}
BackgroundApplicationCheck() {
BackgroundLog > /dev/null
}
Exception() {
ps cax | grep -v grep | grep -E "Creative Cloud"
}

#   Periodically the script runs through a loop, checks for Adobe processes and Adobe background processes and deals with them. Every time it writes the current status into the log file:

while true
do

if Exception  > /dev/null
then
sed -i '' '1,$d' /opt/daemonleash/DaemonLeash.log
date +'%d/%m/%Y %H:%M:%S' >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
echo "-> These Adobe Processes are currently running:" >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
ApplicationLog >> /opt/daemonleash/DaemonLeash.log
BackgroundLog >> /opt/daemonleash/DaemonLeash.log
elif ApplicationCheck && BackgroundApplicationCheck
then
sed -i '' '1,$d' /opt/daemonleash/DaemonLeash.log
date +'%d/%m/%Y %H:%M:%S' >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
echo "-> These Adobe Processes are currently running:" >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
ApplicationLog >> /opt/daemonleash/DaemonLeash.log
BackgroundLog >> /opt/daemonleash/DaemonLeash.log
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" Adobe_CCXProcess.node "AdobeIPCBroker"
elif BackgroundApplicationCheck
then
sed -i '' '1,$d' /opt/daemonleash/DaemonLeash.log
date +'%d/%m/%Y %H:%M:%S' >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" Adobe_CCXProcess.node "AdobeIPCBroker"
echo "-> Adobe Background Processes terminated." >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
ApplicationLog >> /opt/daemonleash/DaemonLeash.log
elif ApplicationCheck
then
sed -i '' '1,$d' /opt/daemonleash/DaemonLeash.log
date +'%d/%m/%Y %H:%M:%S' >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
echo "-> No Background Processes, yet these Adobe Processes are still running:" >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
ApplicationLog >> /opt/daemonleash/DaemonLeash.log
BackgroundLog >> /opt/daemonleash/DaemonLeash.log
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" Adobe_CCXProcess.node "AdobeIPCBroker"
else
sed -i '' '1,$d' /opt/daemonleash/DaemonLeash.log
date +'%d/%m/%Y %H:%M:%S' >> /opt/daemonleash/DaemonLeash.log
echo " " >> /opt/daemonleash/DaemonLeash.log
echo "-> No Adobe Processes are currently running." >> /opt/daemonleash/DaemonLeash.log
fi

#  Loop interval currently set to 60 seconds.
sleep 60

done
