#!/bin/sh

root=$(pwd)

# remove old backup
rm -rf nadekobot_old 1>/dev/null 2>&1

# make a new backup
mv -fT nadekobot nadekobot_old 1>/dev/null 2>&1

# clone new version
git clone -b v4 --recursive --depth 1 https://github.com/epikgallavoir/nedakoc

wget -q -N https://raw.githubusercontent.com/epikgallavoir/bashdeko/main/rebuild.sh
bash rebuild.sh

cd "$root"
rm "$root/n-download.sh"
exit 0
