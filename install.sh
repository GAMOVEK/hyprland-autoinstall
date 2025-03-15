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

#tlp batterie
pacman -S tlp tlp-rdw --noconfirm
systemctl enable tlp.service
systemctl enable NetworkManager-dispatcher.service
systemctl mask systemd-rfkill.service systemd-rfkill.socket

#test cron config
TARGET_SCRIPT="hyprconf.sh"
#nettoie le cron etc
CLEANER_SCRIPT="clean_cron.sh"

# Créer le script clean_cron.sh (sera exécuté une fois au démarrage)
cat > "$CLEANER_SCRIPT" <<EOF
#!/bin/bash
# Supprime la ligne cron contenant le script cible
crontab -l | grep -v "@reboot $TARGET_SCRIPT" | crontab -
# Se supprime lui-même après exécution
rm -- "$0"
EOF

# Rendre les scripts exécutables
chmod +x "$TARGET_SCRIPT"
chmod +x "$CLEANER_SCRIPT"

# Ajouter la tâche cron (exécute TARGET_SCRIPT puis CLEANER_SCRIPT au démarrage)
(crontab -l 2>/dev/null; echo "@reboot $TARGET_SCRIPT && $CLEANER_SCRIPT") | crontab -

sudo reboot 
