#!/bin/bash

# adding vazir font to fonts directory 
if [ ! -d ~/.local/share/fonts/shabnam ];then
    sudo cp -r fonts/shabnam ~/.local/share/fonts
fi 

# build font information cache files
fc-cache -fv

# adding custom font config to telegram tdata 
CUSTOM_FONT=~/.local/share/TelegramDesktop/tdata 
cp fonts.conf $CUSTOM_FONT

exec_var=$(grep ^Exec /usr/share/applications/telegramdesktop.desktop | cut -d'=' -f2,3)
sudo sed -ri "s|^Exec=.*|Exec=env FONTCONFIG_FILE=~/.local/share/TelegramDesktop/fonts.conf $exec_var|"
