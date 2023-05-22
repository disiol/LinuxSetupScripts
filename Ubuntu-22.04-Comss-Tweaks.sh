#!/bin/bash
echo -n "Удалить snap версию Firefox? и установить стандартную deb версию Firefox ? "

read FIREFOX

echo -n "Установить пакет кодеков мультимедия ubuntu-restricted-extras ? "

read EXTRAS

echo -n "Установить пакеты nautilus-admin exe-thumbnailer ? "

read NAUTILUS

echo -n "Решить проблему с отображением кириллицы в текстовом редакторе Gedit ? " 

read GEDIT

echo -n "Установить дополнительную поддержку архиваторов ? "

read RAR

echo -n "Установить дополнительное ПО: GNOME Tweaks, Synaptic, Gdebi, Gnome-tweaks, Chrome-gnome-shell, Flameshot и Peek ? " 

read TWEAKS

echo -n "Установить Bashtop - консольная утилита, аналог Top, для проверки использования ресурсов ? " 

read BASHTOP

echo -n "Установить deb-версию веб-браузера Chromium ?  " 

read CHROMIUM

echo -n "Создать папки ~/.themes и ~/.icons, а также установить инструмент ocs для установки тем из Gnome Look? " 

read OCS

echo -n "Для обладателей видеокарт Nvidia. Выбрать версию видеодрайвера можно в Программы и обновления. Подключить репозиторий ppa:graphics-drivers? " 

read NVIDIA


echo -n "Включить поддержку приложений Flatpak / Flathub? " 

read FLATPAK

echo -n "Установить графичечский клиент ProtonVPN? " 

read PROTONVPN

if [[ "$FIREFOX" == "yes" || "$FIREFOX" == "y" || "$FIREFOX" == "да" || "$FIREFOX" == "д" || "$FIREFOX" == "Д" ]]
then
echo -n "Установить mozillateam " 
  sudo snap disable firefox
  sudo snap remove --purge firefox 

sudo add-apt-repository ppa:mozillateam/ppa -y
cat <<__EOF__ | sudo tee /etc/apt/preferences.d/99firefox
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
__EOF__
  
  sudo apt install firefox firefox-locale-ru -y

fi

if [[ "$EXTRAS" == "yes" || "$EXTRAS" == "y" || "$EXTRAS" == "да" || "$EXTRAS" == "д" || "$EXTRAS" == "Д" ]]
then 
echo -n "install ubuntu-restricted-extras " 
  sudo apt install ubuntu-restricted-extras  -y

fi


if [[ "$NAUTILUS" == "yes" || "$NAUTILUS" == "y" || "$NAUTILUS" == "да" || "$NAUTILUS" == "д" || "$NAUTILUS" == "Д" ]]
then
echo -n "install ubuntu-restricted-extras " 
  sudo apt install nautilus-admin exe-thumbnailer -y
  
  nautilus -q

fi


if [[ "$GEDIT" == "yes" || "$GEDIT" == "y" || "$GEDIT" == "да" || "$GEDIT" == "д" || "$GEDIT" == "Д" ]]
then

  gsettings set org.gnome.gedit.preferences.encodings candidate-encodings "['UTF-8', 'WINDOWS-1251', 'KOI8-R', 'CURRENT', 'ISO-8859-15', 'UTF-16']"

fi


if [[ "$RAR" == "yes" || "$RAR" == "y" || "$RAR" == "да" || "$RAR" == "д" || "$RAR" == "Д" ]]
then

  sudo apt install p7zip-rar rar unrar unace arj cabextract -y
  
echo "Установлены пакеты p7zip-rar rar unrar unace arj cabextract "    

fi


if [[ "$TWEAKS" == "yes" || "$TWEAKS" == "y" || "$TWEAKS" == "да" || "$TWEAKS" == "д" || "$TWEAKS" == "Д" ]]
then


  sudo apt install synaptic gdebi chrome-gnome-shell gnome-tweaks flameshot peek -y

fi

if [[ "$BASHTOP" == "yes" || "$BASHTOP" == "y" || "$BASHTOP" == "да" || "$BASHTOP" == "д" || "$BASHTOP" == "Д" ]]
then


  sudo apt install bashtop -y

fi

if [[ "$CHROMIUM" == "yes" || "$CHROMIUM" == "y" || "$CHROMIUM" == "да" || "$CHROMIUM" == "д" || "$CHROMIUM" == "Д" ]]
then


sudo add-apt-repository ppa:saiarcot895/chromium-beta -y
cat <<__EOF__ | sudo tee /etc/apt/preferences.d/chromium
Package: *
Pin: release o=LP-PPA-saiarcot895-chromium-beta
Pin-Priority: 700
__EOF__

sudo apt install chromium-browser -y

fi

if [[ "$OCS" == "yes" || "$OCS" == "y" || "$OCS" == "да" || "$OCS" == "д" || "$OCS" == "Д" ]]
then


  mkdir ~/.themes
  
  mkdir ~/.icons
  
  sudo apt install libqt5svg5 qml-module-qtquick-controls -y
  
  wget https://dl.comss.org/download//ocs-url_3.1.0-0ubuntu1_amd64.deb
  
  sudo dpkg -i ocs-url*.deb 
  
  rm -rf ocs-url*.deb

fi

if [[ "$NVIDIA" == "yes" || "$NVIDIA" == "y" || "$NVIDIA" == "да" || "$NVIDIA" == "д" || "$NVIDIA" == "Д" ]]
then


 sudo add-apt-repository ppa:graphics-drivers/ppa -y && sudo dpkg --add-architecture i386 && sudo apt update

fi


if [[ "$FLATPAK" == "yes" || "$FLATPAK" == "y" || "$FLATPAK" == "да" || "$FLATPAK" == "д" || "$FLATPAK" == "Д" ]]
then


 sudo apt install flatpak gnome-software-plugin-flatpak gnome-software -y && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 
fi

if [[ "PROTONVPN" == "yes" || "$PROTONVPN" == "y" || "$PROTONVPN" == "да" || "$PROTONVPN" == "д" || "$PROTONVPN" == "Д" ]]
then


 wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb

 sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb
 
 sudo apt update && sudo apt install protonvpn -y && sudo apt install -f
 
 rm -rf protonvpn-stable-release_1.0.1-1_all.deb
 
fi

echo "Текстовая статья по настройке Ubuntu 22.04 доступна на Comss.ru :) ! "
