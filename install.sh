#!/bin/bash

#Variables 
TDATA_DIR=~/.local/share/TelegramDesktop/tdata
TELEGRAM_DESKTOP_FILE=/usr/share/applications/$(ls /usr/share/applications | grep -i telegram)
EXEC_VAR=$(grep ^Exec /usr/share/applications/telegramdesktop.desktop | cut -d'=' -f2,3)


# check telegram '.desktop' file exist or not
if [ -z $TDATA_DIR ];then
    echo "Install your Telegram via package manager!(don't use snap or something like that)"
    exit -1
fi


# adding shabnam font to fonts directory 
if [ ! -d ~/.local/share/fonts/shabnam ];then
    sudo cp -r fonts/shabnam ~/.local/share/fonts/shabnam
fi 


# build font information cache files
fc-cache -fv | grep -i shabnam
cp fc-custom-1.conf $TDATA_DIR

# print Exec variable from '.desktop' file (Usage: debugging stuff)
echo "Exec value => $EXEC_VAR"

# passing fc-custom-1.conf file to telegram environ
sudo sed -ri "s|^Exec=.*|Exec=env FONTCONFIG_FILE=$TDATA_DIR/fc-custom-1.conf $EXEC_VAR|" $TELEGRAM_DESKTOP_FILE

EXEC_VAR=$(grep ^Exec $TELEGRAM_DESKTOP_FILE | cut -d'=' -f2,3)
 
# print Exec variable from '.desktop' file (Usage: debugging stuff)
echo "new Exec vaule => Exec=$EXEC_VAR"
echo "$(tput setaf 1)If you run telegram via terminal just add this to your shell config file (bashrc/zshrc/... ):
    env FONTCONFIG_FILE=$TDATA_DIR/fc-custom-1.conf $EXEC_VAR"
