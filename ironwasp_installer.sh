#!/bin/bash
echo "======================================================================================"
echo "|  _____  _______      ___   ____  _____  ____      ____  _       ______   _______   |"
echo "| |_   _||_   __ \   .'   \`.|_   \|_   _||_  _|    |_  _|/ \    .' ____ \ |_   __ \  | "
echo "|   | |    | |__) | /  .-.  \ |   \ | |    \ \  /\  / / / _ \   | (___ \_|  | |__) | |"
echo "|   | |    |  __ /  | |   | | | |\ \| |     \ \/  \/ / / ___ \   _.____\`.   |  ___/  | "
echo "|  _| |_  _| |  \ \_\  \`-'  /_| |_\   |_     \  /\  /_/ /   \ \_| \____) | _| |_     | "
echo "| |_____||____| |___|\`.___.'|_____|\____|     \/  \/|____| |____|\______.'|_____|    | "
echo "|                                                                                    |"
echo "======================================================================================"
echo "                               IRONWASP Linux Installer                               "
echo ""
echo "Will automatically install and configure IRONWASP."
echo "All you need to click is next next next"
echo ""
echo "Script Written by Anant shrivastava http://anantshri.info"
echo "Grab the latest script here : http://blog.anantshri.info/ironwasp-on-linux/"
echo ""
read -p "press any key to continue" input_cmd
echo "Creating directories"
export WINEARCH=win32
PTH="${HOME}/IRONWASP"
iPTH=$PTH"/installer"
#mkdir $PTH
echo "Starting Wine configuration"
WINEPREFIX=$PTH wineboot
mkdir $iPTH
wget http://winetricks.org/winetricks -O $iPTH/winetricks
chmod 755 $iPTH/winetricks
mkdir -p ${HOME}/.cache/winetricks/dotnet20
mkdir -p ${HOME}/.cache/winetricks/dotnet20sp2/
wget "http://software-files-a.cnet.com/s/software/10/72/60/27/dotnetfx.exe?lop=link&ptype=3001&ontid=10250&siteId=4&edId=3&spi=7ec4900c54e5e5d926fdb88141df2ffa&pid=10726027&psid=10726028&token=1365007355_9a84f88c7edb656b78f0c12e89859064&fileName=dotnetfx.exe" -O ${HOME}"/.cache/winetricks/dotnet20/dotnetfx.exe"
#wget "http://software-files-a.cnet.com/s/software/10/72/60/27/dotnetfx.exe" -O ${HOME}"/.cache/winetricks/dotnet20/dotnetfx.exe"
##wget "http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x86.exe" -O ${HOME}"/.cache/winetricks/dotnet20sp2/dotnetfx.exe"
WINEPREFIX=$PTH sh $iPTH/winetricks dotnet20sp2 fontfix
wget https://github.com/natrix-fork/ironwasp/raw/master/ironwasp.zip -O $iPTH/ironwasp.zip
unzip $iPTH/ironwasp.zip -d $PTH/drive_c/
#rm -rf $PTH
#make executabl script on desktop
chmod +x /wd/IronWasp
