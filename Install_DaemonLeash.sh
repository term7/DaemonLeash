#!/bin/sh

#   Install_DaemonLEASH.sh
#
#   guerill.art / 06.06.2019

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
echo "Adobe and Google keep taps on when and for how long we use our computer."
echo '\n'
echo "DaemonLeash consists of a Launch Daemon, a Launch Agent, four Shell Scripts and"
echo "a Log File. Whenever you start your computer DaemonLeash checks for Adobe and"
echo "Google Launch Daemons and disables them before they can connect to the internet."
echo "It also keeps listening in the background and terminates any persitant Adobe"
echo "Backgound Process as soon as you finish using an Adobe Application."
echo '\n'
echo "Don't worry about missing updates."
echo "You will still be notified as soon as you start an app by Adobe or Google."
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
LOG=$SCRIPT_FOLDER/AdobeBackgroundProcess.log

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
echo "-> More info on GlobalUnloadDaemon.sh: DaemonLEASH/README.txt"
echo '\n'
echo "Installation Path: /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "-> More info on LocalUnloadDaemon.sh: DaemonLEASH/README.txt"
echo '\n'

sudo tee "$GLOBAL_UNLOAD_LIST" << EOF > /dev/null
`echo '#'`!/bin/sh
EOF

sudo tee "$USER_UNLOAD_LIST" << EOF > /dev/null
`echo '#'`!/bin/sh
EOF

echo "Installation Path: /opt/daemonleash/DaemonLeash.sh"
echo "-> More info on DaemonLeash.sh: DaemonLEASH/README.txt"
echo '\n'
echo "Installation Path: /opt/daemonleash/DaemonLeashHelper.sh"
echo "-> More info on DaemonLeashHelper.sh: DaemonLEASH/README.txt"
echo '\n'

sudo tee "$UNLOAD" << EOF > /dev/null
`echo '#'`!/bin/bash
LOG=/opt/daemonleash/AdobeBackgroundProcess.log
ApplicationCheck() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|Creative Cloud"
}
BackgroundCheck() {
ps cax | grep -v grep | grep -E "AdobeCRDaemon|Adobe Desktop Service|Core Sync|Adobe CCXProcess|node|AdobeIPCBroker|LogTransport2|AdobeResourceSynchronizer"
}
while true
do
if ApplicationCheck > /dev/null
then
date +'%d/%m/%Y %H:%M:%S' >> $LOG
BackgroundCheck >> $LOG
else
sed -i '' /$(date '+%Y')/d $LOG
sed -i '' /$(($(date '+%Y') - 1))/d $LOG
sed -i '' /Adobe/d $LOG
sed -i '' /Core/d $LOG
sed -i '' /node/d $LOG
sed -i '' /LogTransport2/d $LOG
sed -i '' /Dreamweaver/d $LOG
date +'%d/%m/%Y %H:%M:%S' >> $LOG
killall "AdobeCRDaemon" "Adobe Desktop Service" "Core Sync" "Adobe CCXProcess.app" "node" "AdobeIPCBroker" "LogTransport2" "AdobeResourceSynchronizer" 2> /dev/null
echo "-> Adobe Background Processes terminated." >> $LOG
sed -i '' /com.adobe.*/d $USER_UNLOAD_LIST;
sed -i '' /com.google.*/d $USER_UNLOAD_LIST;
sed -i '' /com.adobe.*/d $GLOBAL_UNLOAD_LIST;
sed -i '' /com.google.*/d $GLOBAL_UNLOAD_LIST;
find /Library/LaunchDaemons \( -name "com.adobe.*" \) | sed 's/^/sudo launchctl unload /' >> $GLOBAL_UNLOAD_LIST;
find /Library/LaunchDaemons \( -name "com.google.*" \) | sed 's/^/sudo launchctl unload /' >> $GLOBAL_UNLOAD_LIST;
find /Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Users/$(whoami)/Library/LaunchAgents \( -name "com.adobe.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
find /Users/$(whoami)/Library/LaunchAgents \( -name "com.google.*" \) | sed 's/^/launchctl unload /' >> $USER_UNLOAD_LIST;
$GLOBAL_UNLOAD_LIST
fi
sleep 60
done
EOF

sudo tee "$UNLOAD_HELPER" << EOF > /dev/null
`echo '#'`!/bin/bash
ApplicationCheck() {
ps cax | grep -v grep | grep -v LogTransport2 | grep -E "Acrobat|InDesign|Illustrator|Dreamweaver|Photoshop|Lightroom|Audition|Premiere Pro|Media Encoder|Creative Cloud"
}
while true
do
if ApplicationCheck > /dev/null
then
sleep 1
else
$USER_UNLOAD_LIST
fi
sleep 60
done
EOF

echo "sudo chown root:wheel /opt/daemonleash/DaemonLeash.sh"
echo "sudo chown root:wheel /opt/daemonleash/dynamiclist/GlobalUnloadList.sh"
echo "sudo chown $(whoami):admin /opt/daemonleash/DaemonLeashHelper.sh"
echo "sudo chown $(whoami):admin /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "sudo chown root:wheel /opt/daemonleash/AdobeBackgroundProcess.log"
sudo chown root:wheel "$GLOBAL_UNLOAD_LIST" "$UNLOAD" "$LOG"
sudo chown $(whoami):admin "$USER_UNLOAD_LIST" "$UNLOAD_HELPER"

echo "sudo chmod 744 /opt/daemonleash/DaemonLeash.sh"
echo "sudo chmod 744 /opt/daemonleash/dynamiclist/GlobalUnloadList.sh"
echo "sudo chmod 744 /opt/daemonleash/DaemonLeashHelper.sh"
echo "sudo chmod 744 /opt/daemonleash/dynamiclist/LocalUnloadList.sh"
echo "sudo chmod 644 /opt/daemonleash/AdobeBackgroundProcess.log"
sudo chmod 744 "$UNLOAD" "$UNLOAD_HELPER" "$GLOBAL_UNLOAD_LIST" "$USER_UNLOAD_LIST"
sudo chmod 644 "$LOG"

#  DaemonLEASH LaunchDaemons

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                           -----------------------";
echo "                           Preparing Launch Daemon";
echo "                           -----------------------";
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
echo "-> More info on daemon.leash.plist: DaemonLEASH/README.txt"
echo '\n'

DAEMON_FOLDER=/Library/LaunchDaemons
GLOBAL_LEASH_DAEMON_NAME=daemon.leash
GLOBAL_LEASH_DAEMON=$DAEMON_FOLDER/$GLOBAL_LEASH_DAEMON_NAME.plist

[ -e "$GLOBAL_LEASH_DAEMON" ] || sudo touch "$GLOBAL_LEASH_DAEMON"

sudo tee "$GLOBAL_LEASH_DAEMON" << EOF > /dev/null
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Label</key>
<string>${GLOBAL_LEASH_DAEMON_NAME}</string>
<key>RunAtLoad</key>
<true/>
<key>KeepAlive</key>
<true/>
<key>ProgramArguments</key>
<array>
<string>${UNLOAD}</string>
</array>
</dict>
</plist>
EOF

echo "Installation Path: /Library/LaunchAgents/daemon.leash.helper.plist"
echo "-> More info on daemon.leash.helper.plist: DaemonLEASH/README.txt"
echo '\n'

LOCAL_DAEMON_FOLDER=/Library/LaunchAgents
LOCAL_LEASH_HELPER_NAME=daemon.leash.helper
LOCAL_LEASH_HELPER=$LOCAL_DAEMON_FOLDER/$LOCAL_LEASH_HELPER_NAME.plist

[ -e "$LOCAL_LEASH_HELPER" ] || sudo touch "$LOCAL_LEASH_HELPER"

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
echo "                                            -> More Info: DaemonLEASH/README.txt"


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
