#!/bin/bash
echo -n "Workrave"

sudo add-apt-repository ppa:rob-caelers/workrave
sudo apt-get update
sudo apt-get install workrave -y

echo -n "Workrave Ok"
