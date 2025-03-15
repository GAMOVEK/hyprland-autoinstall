#!/bin/bash
sudo pacman -Syyu
sudo pacman -S base-devel linux-headers --noconfirm
sudo pacman -S hyprland kitty gtk3 rofi-wayland dolphin sddm sddm-kcm git nano wget cron --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
sudo yay -Syyu
cd ..

sudo systemctl enable sddm

cat hyprconf.sh | sudo tee /etc/rc.local
chmod +x /etc/rc.local

#tlp batterie
pacman -S tlp tlp-rdw --noconfirm
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket
sudo reboot 
