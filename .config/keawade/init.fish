#!/usr/bin/fish

# Enable RPM Fusion repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install dependencies
sudo dnf install curl wget gcc gcc-c++
# Install terminal applications
sudo dnf install gut exa bat fd-find tmux neovim
# Install desktop applications
sudo dnf install alacritty gnome-tweaks

# Fedora nvidia drivers
sudo dnf install akmod-nvidia

# Fedora codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia


