#!/bin/sh
echo ""
echo "Welcome to NadekoBot."
echo "Downloading the latest installer..."
root=$(pwd)

rm "$root/n-menu.sh" 1>/dev/null 2>&1
wget -N https://gitlab.com/Kwoth/nadeko-bash-installer/-/raw/v4/n-menu.sh

bash n-menu.sh
cd "$root"
rm "$root/n-menu.sh"
exit 0
