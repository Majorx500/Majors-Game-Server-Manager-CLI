#!/bin/bash

GAME=$(whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" --radiolist \
  "Choose Game" 20 78 4 \
  "PaperMC" "PaperMC Minecraft Server" ON \
  "Arma3" "Arma 3 Server" OFF \
  "SCPSL" "SCP Secret Laboratory" OFF 3>&1 1>&2 2>&3)

exit_status=$?

if [[ exit_status -ne 0 ]]; then
  echo "Cancelled Creating Server"
  exit
fi

if [[ $GAME = "PaperMC" ]]; then
  GAME_VER=$(
    whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" --radiolist \
      "Choose Game Version" 20 78 8 \
      "1.21.11" "latest" ON \
      "1.21.10" "" OFF \
      "1.20.5" "" OFF \
      "1.20.4" "" OFF \
      "1.19.4" "" OFF \
      "1.18.2" "" OFF \
      "1.16.5" "" OFF \
      "1.16.4" "" OFF \
      3>&1 1>&2 2>&3
  )
fi

exit_status=$?

if [[ exit_status -ne 0 ]]; then
  echo "Cancelled Creating Server"
  exit
fi

GAME_DIR=$(
  whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" \
    --inputbox "Choose gameserver directory(default= ~/servers/${GAME,,} server" 20 78 \
    "$HOME/servers/${GAME,,}server" \
    3>&1 1>&2 2>&3
)

case $GAME in
"PaperMC")
  ./mgsm/scripts/install/papermc.sh $GAME_VER $GAME_DIR
  ;;
esac
