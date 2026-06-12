#!/bin/bash
# Install script for Chrome-profile-badger on Linux Mint / Ubuntu

set -e

# Clear display of script title
echo "=============================================="
echo "      Chrome-profile-badger Installer"
echo "=============================================="

# Check for sudo/root permissions
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this installer with sudo:"
  echo "sudo ./install.sh"
  exit 1
fi

# Locate the chrome-profile-badger executable in the same directory as the script
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
SOURCE_EXE="${SCRIPT_DIR}/chrome-profile-badger"

if [ ! -f "$SOURCE_EXE" ]; then
  echo "Error: Could not find 'chrome-profile-badger' file in the directory: $SCRIPT_DIR"
  echo "Make sure you have downloaded or extracted both files to the same folder."
  exit 1
fi

echo "1. Installing system dependencies (Apt)..."
apt-get update
apt-get install -y python3-pip python3-xlib python3-pil python3-gi gir1.2-gtk-3.0

echo "2. Copying executable to /usr/local/bin/chrome-profile-badger..."
cp "$SOURCE_EXE" /usr/local/bin/chrome-profile-badger
chmod +x /usr/local/bin/chrome-profile-badger

echo "3. Creating system start menu desktop entry..."
cat << 'EOF' > /usr/share/applications/chrome-profile-badger.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Chrome-profile-badger
Comment=Create badged launchers for Google Chrome profiles
Exec=chrome-profile-badger
Icon=google-chrome
Terminal=false
Categories=Utility;Settings;
StartupWMClass=chrome-profile-badger
EOF

chmod 644 /usr/share/applications/chrome-profile-badger.desktop

# Refresh the system desktop menu database
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database /usr/share/applications
fi

echo ""
echo "=============================================="
echo "  Chrome-profile-badger successfully installed!"
echo "=============================================="
echo "You can now open it from your Linux Mint Start Menu"
echo "(look for 'Chrome-profile-badger' under Accessories/Preferences)"
echo "or run 'chrome-profile-badger' in a terminal."
echo "=============================================="
