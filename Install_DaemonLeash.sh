#!/bin/sh

#   Install_DaemonLeash.sh
#
#   guerill.art / 06.08.2019

#   This installation script has a lot of functionality that may be considered unnecessary. I.e. it pauses at certain times during the installation and displays a countdown. It echoes all commands to the terminal window and at certain times during the installation it displays informative texts and asks for user input. From a coders perspective this may be a waste of time - yet we have written this script with users in mind that are not used to the command line. We hope that by running this script, users will take the time to go through the installation process, to read and to understand some of the mechanics, not only of this script but also of their own computers.

#   * * *

#   MIT License
#   Copyright (c) 2019

#   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

#   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


function countdown
{
local OLD_IFS="${IFS}"
IFS=":"
local ARR=( $1 )
local SECONDS=$((  (ARR[0] * 60 * 60) + (ARR[1] * 60) + ARR[2]  ))
local START=$(date +%s)
local END=$((START + SECONDS))
local CUR=$START

while [[ $CUR -lt $END ]]
do
CUR=$(date +%s)
LEFT=$((END-CUR))

printf "\r%02d:%02d:%02d" \
$((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

sleep 1
done
IFS="${OLD_IFS}"
echo "        "
}

sudo echo " "
echo '\n'
echo "       __"
echo "      /\\ \\"
echo "      \\_\\ \\     __       __    ___ ___     ___     ___"
echo "      /'_\` \\  /'__\`\\   /'__\`\\/' __\` __\`\\  / __\`\\ /' _ \`\\"
echo "     /\\ \\_\\ \\/\\ \\_\\.\\_/\\  __//\\ \\/\\ \\/\\ \\/\\ \\_\\ \\/\\ \\/\\ \\"
echo "     \\ \\___,_\\ \\__/.\\_\\ \\____\\ \\_\\ \\_\\ \\_\\ \\____/\\ \\_\\ \\_\\"
echo "      \\/__,_ /\\/__/\\/_/\\/____/\\/_/\\/_/\\/_/\\/___/  \\/_/\\/_/"
echo "                                ___                            __"
echo "                               /\\_ \\                          /\\ \\"
echo "                               \\//\\ \\      __     __      ____\\ \\ \\___"
echo "                                 \\ \\ \\   /'__\`\\ /'__\`\\   /',__\\\\\\ \\  _ \`\\"
echo "                                  \\_\\ \\_/\\  __//\\ \\_\\.\\_/\\__, \`\\\\\\ \\ \\ \\ \\"
echo "                                  /\\____\\ \\____\\ \__/.\\_\\/\\____/ \\ \\_\\ \\_\\"
echo "                                  \\/____/\\/____/\\/__/\\/_/\\/___/   \\/_/\\/_/"
echo '\n'
echo '\n'
echo "                           D - A - E - M - O - N - L - E - A - S - H"
echo '\n'
countdown "00:00:07"
echo "--------------------------------------------------------------------------------"

echo '\n'
echo '\n'
echo "                                         / DAEMONLEASH / WHAT THIS SCRIPT DOES /"
echo "--------------------------------------------------------------------------------"
echo " "
echo "We have been using Adobe Creative Cloud for quite a while now and it came to our"
echo "attention that several background processes connect to Adobe Servers to send out"
echo "data as soon as we start our Computer (even though we did not start any Adobe"
echo "Application). Google Software does exactly the same thing. We don't know exactly"
echo "what data is being sent out - yet we think that it is already intolerable that"
echo "Adobe and Google keep taps on when and for how long we use our computers."
echo '\n'
echo "DaemonLeash consists of a Launch Daemon, a Launch Agent, four Shell Scripts and"
echo "a Log File. Whenever you start your computer DaemonLeash checks for Adobe and"
echo "Google Launch Daemons and disables them before they can connect to the internet."
echo "It also keeps listening in the background and terminates any persitent Adobe"
echo "Backgound Process as soon as you finish using your Adobe Applications."
echo '\n'
echo " "
echo " "
echo " "
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to continue: "

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                 ---------------------------------------------";
echo "                 ARE YOU SURE YOU WANT TO INSTALL DAEMONLEASH?";
echo "                 ---------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
while true
do
read -r -p "Type [install] to install, or [exit] to abort and press [ENTER]: " CONT
case $CONT in
[i][n][s][t][a][l][l])


#  Install DaemonLEASH

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                      -------------------------------";
echo "                      Preparing Dynamic Shell Scripts";
echo "                      -------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:03"


echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'

SCRIPT_FOLDER=/opt/daemonleash
LIST_FOLDER=/opt/daemonleash/dynamiclist

GLOBAL_UNLOAD_LIST=$LIST_FOLDER/GlobalUnloadList.sh
UNLOAD=$SCRIPT_FOLDER/DaemonLeash.sh
UNLOAD_HELPER=$SCRIPT_FOLDER/DeamonLeashHelper.sh
USER_UNLOAD_LIST=$LIST_FOLDER/LocalUnloadList.sh
LOG=$SCRIPT_FOLDER/DaemonLeash.log

echo "sudo mkdir /opt/daemonleash"
sudo mkdir "$SCRIPT_FOLDER"
echo "sudo mkdir /opt/daemonleash/dynamiclist"
sudo mkdir "$LIST_FOLDER"
echo "sudo touch $LOG"
sudo touch "$LOG"
echo '\n'

[ -e "$GLOBAL_UNLOAD_LIST" ] || sudo touch "$GLOBAL_UNLOAD_LIST"
[ -e "$USER_UNLOAD_LIST" ] || sudo touch "$USER_UNLOAD_LIST"
[ -e "$UNLOAD" ] || sudo touch "$UNLOAD"


echo "Installation Path: /opt/daemonleash/dynamiclist/GlobalUnloadList.sh"
echo "-> More info on GlobalUnloadDaemon.sh: DaemonLEASH/README.md"
echo '\n'
echo "Installation Path: /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "-> More info on LocalUnloadDaemon.sh: DaemonLEASH/README.md"
echo '\n'

#   Initially these are two empty shell scripts. At every startup Daemonleash will check for all Adobe/Google LaunchDaemons and Launch Agents and create and update two separate unload command lists. Sometimes after an update some LaunchDaemons have altered names, or new LaunchDaemons are added. DaemonLeash makes sure that we catch all of them. The global unload list is owned by root and handles all Adobe/Google Launch Daemons, while the user unload list is owned by the current user. This list handles all Adobe/Google Launch Agents. As soon as the command lists are complete, DaemonLeash runs them to unload all Adobe/Google LaunchDaemons and LaunchAgents.

sudo tee "$GLOBAL_UNLOAD_LIST" << EOF > /dev/null
#!/bin/sh
EOF

sudo tee "$USER_UNLOAD_LIST" << EOF > /dev/null
#!/bin/sh
EOF

echo "Installation Path: /opt/daemonleash/DaemonLeash.sh"
echo "-> More info on DaemonLeash.sh: DaemonLEASH/README.md"
echo '\n'
echo "Installation Path: /opt/daemonleash/DaemonLeashHelper.sh"
echo "-> More info on DaemonLeashHelper.sh: DaemonLEASH/README.md"
echo '\n'

#   The main script is owned by root. It is responsible for setting all necessary variables and to check if background processes keep running or respawning and to terminate them whenever possible. It also writes the current status into a log file. We don't want to accumulate a huge log here, which is why only the most current status of running Adobe processes is logged and displayed here.

sudo tee "$UNLOAD" << EOF > /dev/null
#!/bin/bash

#   First DaemonLeash clears the old unload command list of Adobe/Google LaunchDaemons and LaunchAgents.
sed -i '' /com.adobe.*/d $USER_UNLOAD_LIST;
sed -i '' /com.google.*/d $USER_UNLOAD_LIST;
sed -i '' /com.adobe.*/d $GLOBAL_UNLOAD_LIST;
sed -i '' /com.google.*/d $GLOBAL_UNLOAD_LIST;

#   Next it fills the two unload command lists again with all Adobe/Google Launch Daemons and LaunchAgents.
find /Library/LaunchDaemons \( -name "com.adobe.*" \) | sed 's/^/sudo launchctl unload /' >> $GLOBAL_UNLOAD_LIST;
find /Library/LaunchDaemons \( -name "com.google.*" \) | sed 's/^/sudo launchctl unload /' >> $GLOBAL_UNLOAD_LIST;
find /Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Users/$(whoami)/Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Users/$(whoami)/Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;

#   Because this script is started and owned by root it can now also unload all LaunchDaemons

$GLOBAL_UNLOAD_LIST

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
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "AdobeCRDaemon|Adobe Desktop Service|Core Sync|Adobe CCXProcess|node|AdobeIPCBroker|LogTransport2|AdobeResourceSynchronizer"
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
sed -i '' '1,\$d' $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
echo " " >> $LOG
echo "-> These Adobe Processes are currently running:" >> $LOG
echo " " >> $LOG
ApplicationLog >> $LOG
BackgroundLog >> $LOG
elif ApplicationCheck && BackgroundApplicationCheck
then
sed -i '' '1,\$d' $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
echo " " >> $LOG
echo "-> These Adobe Processes are currently running:" >> $LOG
echo " " >> $LOG
ApplicationLog >> $LOG
BackgroundLog >> $LOG
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" "AdobeIPCBroker"
elif BackgroundApplicationCheck
then
sed -i '' '1,\$d' $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
echo " " >> $LOG
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" "AdobeIPCBroker"
echo "-> Adobe Background Processes terminated." >> $LOG
echo " " >> $LOG
ApplicationLog >> $LOG
elif ApplicationCheck
then
sed -i '' '1,\$d' $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
echo " " >> $LOG
echo "-> No Background Processes, yet these Adobe Processes are still running:" >> $LOG
echo " " >> $LOG
ApplicationLog >> $LOG
BackgroundLog >> $LOG
killall ACCFinderSync "Adobe Creative" "Core Sync" "AdobeCRDaemon" "Adobe CCXProcess.app" "Adobe Desktop Service" "Adobe Crash Reporter" "LogTransport2" "AdobeResourceSynchronizer" "node" "AdobeIPCBroker"
else
sed -i '' '1,\$d' $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
echo " " >> $LOG
echo "-> No Adobe Processes are currently running." >> $LOG
fi

#  Loop interval currently set to 60 seconds.
sleep 60

done
EOF

#  The unload helper script is owned by the current user. Its sole purpose is to periodically check for Adobe/Google LaunchAgents and to unload them.

sudo tee "$UNLOAD_HELPER" << EOF > /dev/null
#!/bin/bash
$USER_UNLOAD_LIST
ApplicationCheck() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|After Effects|Creative Cloud" > /dev/null
}
while true
do
if ApplicationCheck
then
sleep 60
else
$USER_UNLOAD_LIST
fi
done
EOF

echo "sudo chown root:wheel /opt/daemonleash/DaemonLeash.sh"
echo "sudo chown root:wheel /opt/daemonleash/dynamiclist/GlobalUnloadList.sh"
echo "sudo chown $(whoami):admin /opt/daemonleash/DaemonLeashHelper.sh"
echo "sudo chown $(whoami):admin /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "sudo chown root:wheel /opt/daemonleash/DaemonLeash.log"

#  At this point we define file ownership:

sudo chown root:wheel "$GLOBAL_UNLOAD_LIST" "$UNLOAD" "$LOG"
sudo chown $(whoami):admin "$USER_UNLOAD_LIST" "$UNLOAD_HELPER"

echo "sudo chmod 744 /opt/daemonleash/DaemonLeash.sh"
echo "sudo chmod 744 /opt/daemonleash/dynamiclist/GlobalUnloadList.sh"
echo "sudo chmod 744 /opt/daemonleash/DaemonLeashHelper.sh"
echo "sudo chmod 744 /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "sudo chmod 644 /opt/daemonleash/AdobeBackgroundProcess.log"

#  At this point we define our file permissions:

sudo chmod 744 "$UNLOAD" "$UNLOAD_HELPER" "$GLOBAL_UNLOAD_LIST" "$USER_UNLOAD_LIST"
sudo chmod 644 "$LOG"

#  DaemonLeash LaunchDaemon / LaunchAgent

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                           ------------------------";
echo "                           Preparing Launch Daemons";
echo "                           ------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:03"

echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'

echo "Installation Path: /Library/LaunchDaemons/daemon.leash.plist"
echo "-> More info on daemon.leash.plist: DaemonLEASH/README.md"
echo '\n'

DAEMON_FOLDER=/Library/LaunchDaemons
GLOBAL_LEASH_DAEMON_NAME=daemon.leash
GLOBAL_LEASH_DAEMON=$DAEMON_FOLDER/$GLOBAL_LEASH_DAEMON_NAME.plist

[ -e "$GLOBAL_LEASH_DAEMON" ] || sudo touch "$GLOBAL_LEASH_DAEMON"

#  The DaemonLeash LaunchDaemon runs at boot time as root.

sudo tee "$GLOBAL_LEASH_DAEMON" << EOF > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>KeepAlive</key>
<true/>
<key>Label</key>
<string>${GLOBAL_LEASH_DAEMON_NAME}</string>
<key>ProgramArguments</key>
<array>
<string>${UNLOAD}</string>
</array>
<key>RunAtLoad</key>
<true/>
</dict>
</plist>
EOF

echo "Installation Path: /Library/LaunchAgents/daemon.leash.helper.plist"
echo "-> More info on daemon.leash.helper.plist: DaemonLEASH/README.md"
echo '\n'

LOCAL_DAEMON_FOLDER=/Library/LaunchAgents
LOCAL_LEASH_HELPER_NAME=daemon.leash.helper
LOCAL_LEASH_HELPER=$LOCAL_DAEMON_FOLDER/$LOCAL_LEASH_HELPER_NAME.plist

[ -e "$LOCAL_LEASH_HELPER" ] || sudo touch "$LOCAL_LEASH_HELPER"

#  The DaemonLeash LaunchAgent runs at login time as the current user.

sudo tee "$LOCAL_LEASH_HELPER" << EOF > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>${LOCAL_LEASH_HELPER_NAME}</string>
<key>RunAtLoad</key>
<true/>
<key>KeepAlive</key>
<true/>
<key>ProgramArguments</key>
<array>
<string>${UNLOAD_HELPER}</string>
</array>
</dict>
</plist>
EOF

#  At last we set file ownership and permissions and load both Daemonleash LaunchDaemon and LaunchAgent.

echo "sudo chown root:wheel /Library/LaunchDaemons/daemon.leash.plist"
echo "sudo chown root:wheel /Library/LaunchAgents/daemon.leash.helper.plist"
sudo chown root:wheel "$GLOBAL_LEASH_DAEMON" "$LOCAL_LEASH_HELPER"

echo "sudo chmod 644 /Library/LaunchDaemons/daemon.leash.plist"
echo "sudo chmod 644 /Library/LaunchAgents/daemon.leash.helper.plist"
sudo chmod 644 "$GLOBAL_LEASH_DAEMON" "$LOCAL_LEASH_HELPER"

echo "sudo launchctl load /Library/LaunchDaemons/daemon.leash.plist"
sudo launchctl load "$GLOBAL_LEASH_DAEMON"
echo "launchctl load /Library/LaunchAgents/daemon.leash.helper.plist"
launchctl load "$LOCAL_LEASH_HELPER"

echo '\n'
echo '\n'
echo "                                    / USER ACTION REQUIRED: SYSTEM PREFERENCES /"
echo "--------------------------------------------------------------------------------"
echo " "
echo "Both Adobe and Google automatically install Plugins and Startup Items on your"
echo "Computer. You can disable them at any time:"
echo '\n'
echo "Open your System Preferences, select Users & Groups and your Admin Account, then"
echo "click the small lock in the bottom left corner and type in your password. Select"
echo "Login Items and remove all apps that you don't want to start whenever you log"
echo "in (select the app and click -). Next, go back to System Preferences, click on"
echo "Extensions and remove all hooks under any Plugin you want to disable."
echo '\n'
echo "If you further want to monitor, maybe even block outgoing connections of active"
echo "apps, that send data from your computer to their developers while you are using"
echo "them, we recommend you purchase Little Snitch. Little Snitch is a host-based"
echo "application firewall for macOS. It can be used to monitor apps, preventing or"
echo "permitting them to connect to attached networks through advanced rules. A Single"
echo "License costs about \$45/45€/£45."
echo " "
echo "                                              -> https://www.obdev.at/index.html"
echo "--------------------------------------------------------------------------------"
read -s -p "Press [ENTER] to exit the installation script: "

echo '\n'
echo '\n'
echo '\n'
echo "--------------------------------------------------------------------------------"
echo '\n'
echo "                   __"
echo "                  /\\ \\__"
echo "       ____     __\\ \\ ,_\\  __  __  _____"
echo "      /',__\\  /'__\`\\ \\ \\/ /\\ \\/\\ \\/\\ '__\`\\"
echo "     /\\__, \`\\/\\  __/\\ \\ \\_\\ \\ \\_\\ \\ \\ \\_\\ \\"
echo "     \\/\\____/\\ \\____\\\\\\ \\__ \\\\ \\____/\\ \\ ,__/"
echo "      \\/___/  \\/____/ \\/__/ \\/___/  \\ \\ \\/"
echo "                                     \\ \\_\\"
echo "                                      \\/_/"
echo "                                         ___           __"
echo "                                        /\\_ \\         /\\ \\__"
echo "          ___    ___     ___ ___   _____\\//\\ \\      __\\ \\ ,_\\    __"
echo "         /'___\\ / __\`\\ /' __\` __\`\\/\\ '__\`\\\\\\ \\ \\   /'__\`\\ \\ \\/  /'__\`\\"
echo "        /\\ \\__//\\ \\_\\ \\/\\ \\/\\ \\/\\ \\ \\ \\\\_\\ \\\\\\_\\ \\_/\\  __/\\ \\ \\_/\\  __/"
echo "        \\ \\____\\ \\____/\\ \\_\\ \\_\\ \\_\\ \\ ,__//\\____\\ \\____\\\\\\ \\__\\ \\____\\"
echo "         \\/____/\\/___/  \\/_/\\/_/\\/_/\\ \\ \\/ \\/____/\\/____/ \\/__/\\/____/"
echo "                                     \\ \\_\\"
echo "                                      \\/_/"
echo '\n'
echo "                                            -> More Info: DaemonLEASH/README.md"


break;;
[e][x][i][t])

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                A B O R T I N G";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"
exit;;
*)

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                        --------------------------------";
echo "                        INVALID INPUT - PLEASE TRY AGAIN";
echo "                        --------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
;;
esac
done

exit
