#!/bin/sh
echo ""
echo "Welcome to NadekoBot."
echo "Downloading the latest installer..."
root=$(pwd)

rm "$root/n-menu.sh" 1>/dev/null 2>&1
wget -N https://raw.githubusercontent.com/epikgallavoir/bashdeko/main/n-menu.sh

bash n-menu.sh
cd "$root"
rm "$root/n-menu.sh"
exit 0
