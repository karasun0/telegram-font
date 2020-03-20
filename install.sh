#!/bin/bash

# adding vazir font to fonts directory 
if [ ! -d /usr/share/fonts/shabnam ];then
    sudo cp -r fonts/shabnam /usr/share/fonts
fi 

# build font information cache files
fc-cache -fv

# adding custom font config to telegram tdata 
CUSTOM_FONT=~/.local/share/TelegramDesktop/tdata 
if [ ! -f $CUSTOM_FONT ];then 
    cp fc-custom-1.conf $CUSTOM_FONT
fi
