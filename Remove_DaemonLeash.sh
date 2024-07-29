#!/bin/sh

#   Remove_DaemonLeash.sh
#
#   term7 / 06.08.2019

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

bold=$(tput bold)
normal=$(tput sgr0)

sudo echo " "
echo " "
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                  --------------------------------------------";
echo "                  ARE YOU SURE YOU WANT TO DELETE DAEMONLEASH?";
echo "                  --------------------------------------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'

while true
do
read -p "Type [delete] to remove DaemonLEASH, or [exit] to abort + press [ENTER]: " CONT
case $CONT in
[d][e][l][e][t][e])

echo "--------------------------------------------------------------------------------"
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'

SCRIPT_FOLDER=/Users/Shared/Enhancements/DaemonLeash

DAEMON_FOLDER=/Library/LaunchDaemons
GLOBAL_LEASH_DAEMON_NAME=info.term7.daemon.leash
GLOBAL_LEASH_DAEMON=$DAEMON_FOLDER/$GLOBAL_LEASH_DAEMON_NAME.plist

LOCAL_DAEMON_FOLDER=/Library/LaunchAgents
LOCAL_LEASH_HELPER_NAME=info.term7.daemon.leash.helper
LOCAL_LEASH_HELPER=$LOCAL_DAEMON_FOLDER/$LOCAL_LEASH_HELPER_NAME.plist

echo "sudo launchctl unload /Library/LaunchDaemons/info.term7.daemon.leash.plist"
echo "launchctl unload /Library/LaunchAgents/info.term7.daemon.leash.helper.plist"
sudo launchctl unload "$GLOBAL_LEASH_DAEMON"
launchctl unload "$LOCAL_LEASH_HELPER"
echo '\n'
echo "sudo rm -f /Library/LaunchDaemons/info.term7.daemon.leash.plist"
sudo rm -f "$GLOBAL_LEASH_DAEMON"
echo "sudo rm -f /Library/LaunchAgents/info.term7.daemon.leash.helper.plist"
sudo rm -f "$LOCAL_LEASH_HELPER"

echo "sudo rm -R -f /Users/Shared/Enhancements/DaemonLeash"
sudo rm -R -f "$SCRIPT_FOLDER"

echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo "                                ---------------";
echo "                                F I N I S H E D";
echo "                                ---------------";
echo '\n'
echo '\n'
echo '\n'
echo '\n'
echo '\n'
countdown "00:00:7"

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
