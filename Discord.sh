#!/bin/bash
echo -n "Discord "

 sudo apt update
 sudo apt install gdebi-core wget
 
  wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo gdebi ~/discord.deb 
