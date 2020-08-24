#!/bin/sh

wget https://github.com/love2d/love/releases/download/11.3/love-11.3-win32.zip
unzip love-11.3-win32.zip
cd client/ && zip -9 -r game.love . && cd ..
cat love-11.3-win32/love.exe client/game.love > love-11.3-win32/game.exe
zip client.zip love-11.3-win32/*
rm -r love-11.3-win32/ client/game.love love-11.3-win32.zip
