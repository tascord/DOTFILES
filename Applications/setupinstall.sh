sudo pacman -Syu

# Create the home direcroy layout
sh ./mkhome.sh

# Make sure important stuff is downloaded and up to date
sudo pacman -S wpa_supplicant dhcpcd git

# Make sure GIT is installed

# Install YAY
sudo pacman -S go
mkdir tmp/
cd tmp/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ../../

# Copy wallpapers
cp ../Wallpapers/* ~/Desktop/Backgrounds

# Move config files
cp ../config/* ~/.config/

# Move .xinit
cp ../Misc/xinitrc ~/.xinitrc

# Move fonts
cp ../fonts/* /usr/share/fonts/ -r
fc-cache

# Install the desktop stuff
yay -S --noconfirm xorg
yay -S --noconfirm bspwm
yay -S --noconfirm pywal
yay -S --noconfirm picom
yay -S --noconfirm dunst
yay -S --noconfirm thunar
yay -S --noconfirm ly
sudo systemctl enable ly.service

# Audio
yay -S --noconfirm pulseaudio
yay -S --noconfirm pulseaudio-alsa
yay -S --noconfirm pulseaudio-bluetooth
yay -S --noconfirm pulseeffects-git
yay -S --noconfirm gnome-bluetooth

# Apps
yay -S --noconfirm spotify
yay -S --noconfirm spotify-tui
yay -S --noconfirm discord
yay -S --noconfrm code
yay -S --nocnfirm wps

# Install ZSH
yay -S --noconfirm oh-my-zsh-git
