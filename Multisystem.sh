#!/bin/bash
echo -n "MultisystemInstal"

sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'

wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | sudo apt-key add -

sudo sudo apt-get update

sudo sudo apt-get install multisystem -y

echo -n "MultisystemInstal Ok"
