#!/bin/bash

# website link: https://www.plasticscm.com/plastic-for-linux

# ====================================
# 1. ADD THE PLASTIC SCM REPOSITORYxx 
# ====================================

sudo apt-get update
sudo apt-get install -y apt-transport-https
echo "deb https://www.plasticscm.com/plasticrepo/stable/ubuntu/ ./" | sudo tee /etc/apt/sources.list.d/plasticscm-stable.list
wget https://www.plasticscm.com/plasticrepo/stable/ubuntu/Release.key -O - | sudo apt-key add -
sudo apt-get update

# https://plasticscmsupport.zendesk.com/hc/en-us/articles/360013103159-How-to-Install-Plastic-GUI-in-Ubuntu-19-10-and-later-

cd /etc/apt/sources.list.d/
sudo touch bionic-oldlibs.list
echo "deb http://us.archive.ubuntu.com/ubuntu/ bionic main restricted
deb http://us.archive.ubuntu.com/ubuntu/ bionic universe" > bionic-oldlibs.list
cd
sudo apt update

# If the apt-update is missing a key run:
# sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 3B4FE6ACC0B21F32

# If behind firewall:
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 3B4FE6ACC0B21F32

# =======================================
# 2. Installing Plastic SCM Cloud Edition
# =======================================

sudo apt-get install plasticscm-cloud -y

plasticgui #done


