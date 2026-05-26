echo Please make sure your system is already set up with a user account and that you have credentials for sudo!
read -p "Press enter to continue..."

echo Updating the pacman registry...
pacman -Syu

echo Installing the micro editor...
pacman -S micro --noconfirm

echo Installing X, i3 and related packages...
sudo pacman -S \
xorg-server \
xorg-xinit \
i3-wm \
polybar \
dmenu \
alacritty \
picom \
feh \
dunst \
network-manager-applet

echo Downloading wallpaper...
mkdir -p ~/Pictures/wallpapers
curl https://github.com/MrDLingters/MonochromeWin11/blob/main/Wallpapers/wallhaven-l36zrl.jpg > ~/Pictures/wallpapers/wallpaper.jpg

echo Setting up i3...
echo "exec i3" > ~/.xinitrc
# (we should copy the configs from the repo)

echo Setting up Polybar
# (copy configs from repo)
chmod +x ~/.config/polybar/launch.sh

echo Starting NetworkManager
systemctl enable NetworkManager
systemctl start NetworkManager