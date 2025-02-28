#!/bin/bash
sudo pacman -Syu
sudo pacman -S base-devel linux-headers -y
Sudo pacman -S hyprland kitty gtk3 rofi-wayland dolphin sddm sddm-kcm git sudo -y
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo wrappedhl > ~/wrappedhl
echo .bash_profile > ~/.bash_profile
echo 00-hyprland.conf > /etc/sddm.conf.d/00-hyprland.conf
sed -i 's/setxkbmap fr/setxkbmap us/' ~/.config/hypr/hyprland.conf
