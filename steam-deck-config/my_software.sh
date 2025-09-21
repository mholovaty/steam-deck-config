# /etc/pacman.conf
# SigLevel = TrustAll

# Initial set-up
sudo steamos-readonly disable
# sudo mv /etc/pacman.d/gnupg /tmp
sudo pacman-key --init
sudo pacman-key --populate archlinux holo
sudo pacman -Syu

# Check snapshot version in /etc/pacman.conf
# Current version is 3.6
# If pacman complains that local versions are newer, bump snapshot version
# that matches local packages
# https://steamdeck-packages.steamos.cloud/archlinux-mirror/

# Install Emacs
sudo pacman -Sy --overwrite "*" \
     emacs

# Install base-devel
sudo pacman -Sy --overwrite "*" \
     glibc linux-api-headers base-devel locate git mc imagemagick python-pip \
     dosbox \
     cmake sdl_mixer sdl_gfx sdl_image yaml-cpp \
     `# extra-rel/sdl2_ttf` \
     sdl2_ttf \
     mesa glu \
     wol
sudo updatedb

# Install alsa
sudo pacman -Sy alsa alsa-lib

# Install alsamixer
cd ~/Downloads/alsaequal/
makepkg -si

# sshd
systemctl enable sshd
systemctl start sshd

# Games
sudo pacman -Sy --overwrite "*" \
     openmw

# Install CUPS
sudo pacman -Sy --overwrite "*" \
     cups print-manager system-config-printer nss-mdns foomatic-db-engine foomatic-db-ppds foomatic-db-nonfree-ppds ghostscript cups-filters     

# Enable CUPS
sudo systemctl enable --now avahi-daemon
sudo systemctl enable --now cups

# Install mplayer
sudo pacman -Sy --overwrite "*" \
     mplayer

# Install speech-dispatcher
sudo pacman -Sy --overwrite "*" \
     speech-dispatcher
