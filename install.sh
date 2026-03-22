#!/bin/bash

OPTION=""
GAME=""
GAME_DIR=""
GAME_VER=""



whiptail --title "Choose Game Server" --backtitle "Major's Game Server Manager" --radiolist \
  "Choose user's permissions" 20 78 4 \
  "NET_OUTBOUND" "Allow connections to other hosts" ON \
  "NET_INBOUND" "Allow connections from other hosts" OFF \
  "LOCAL_MOUNT" "Allow mounting of local devices" OFF \
  "REMOTE_MOUNT" "Allow mounting of remote devices" OFF
