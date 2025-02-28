#/bin/bash
sudo pacman -Syu
sudo pacman -S base-devel linux-headers
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
Sudo pacman -S hyprland kitty gtk3 rofi-wayland dolphin sddm sddm-kcm
echo wrappedhl > ~/wrappedhl
echo .bash_profile > ~/.bash_profile
echo 00-hyprland.conf > /etc/sddm.conf.d/00-hyprland.conf
sed -i 's/setxkbmap fr/setxkbmap us/' /chemin/vers/votre/hyprland.conf
