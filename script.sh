#!/bin/bash
set -e
echo Please make sure your system is already set up with a user account and that you have credentials for sudo!
echo Take into account that this system has been setup in a VM with 3D acceleration enabled!!
read -p "Press enter to continue..."

echo Updating the pacman registry...
sudo pacman -Syu --noconfirm

echo Installing virtualbox guest utilities...
sudo pacman -S virtualbox-guest-utils mesa --noconfirm
sudo systemctl enable --now vboxservice

echo Installing the micro editor...
sudo pacman -S micro --noconfirm

echo Installing X, i3 and related packages...
sudo pacman -S curl xorg-server xorg-xinit i3-wm polybar dmenu alacritty picom feh dunst rofi networkmanager network-manager-applet --noconfirm

echo Downloading wallpaper...
mkdir -p ~/Pictures
curl -L https://raw.githubusercontent.com/MrDLingters/MonochromeWin11/main/Wallpapers/wallhaven-l36zrl.jpg -o ~/Pictures/wallpaper.jpg

echo Setting up i3...
echo "exec i3" > ~/.xinitrc
mkdir -p ~/.config/i3
cp ./i3/config ~/.config/i3/config

echo Setting up Polybar...
mkdir -p ~/.config/polybar
cp -r ./polybar/* ~/.config/polybar/
chmod +x ~/.config/polybar/launch.sh

echo Setting up Picom...
mkdir -p ~/.config/picom
cp ./picom/picom.conf ~/.config/picom/picom.conf

echo Setting up Alacritty...
mkdir -p ~/.config/alacritty
cp -r ./alacritty/* ~/.config/alacritty/

echo Setting up Rofi...
mkdir -p ~/.config/rofi
cp ./rofi/config.rasi ~/.config/rofi/config.rasi

echo Copying gtk theme...
mkdir -p ~/.config/gtk-3.0
cp ./gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

echo Starting NetworkManager..
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

echo Finished!
echo Get into the desktop environment by running "startx".