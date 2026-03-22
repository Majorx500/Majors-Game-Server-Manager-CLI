#!/bin/bash

# $1 -- gameversion $2 -- gamedir

GAME_URL=$(curl -X 'GET' \
  "https://fill.papermc.io/v3/projects/paper/versions/$1/builds/latest" \
  -H 'accept: application/json' | jq -r '.downloads."server:default".url')

mkdir -p "$2/serverfiles"

cd "$2" || exit

wget "$GAME_URL" -O "$2/serverfiles/papermc.jar" 1>/dev/null
chmod +x "$2/serverfiles/papermc.jar"

if (whiptail --title "Eula Agreement" --yesno "Do you agree to the Minecraft EULA? (https://aka.ms/MinecraftEULA)" 8 70); then
  echo "eula=true" >$2/serverfiles/eula.txt
else
  echo "Eula needed to run server. Edit $2/serverfiles/eula.txt to agree to it."
  echo "eula=false" >$2/serverfiles/eula.txt
fi

echo "Installing server"

cd "./serverfiles"
echo "stop" | java -jar "papermc.jar" --nogui 1>/dev/null 2>/dev/null
cd ".."
echo "Server created"
