#!/bin/sh

root=$(pwd)

# remove old backup
rm -rf nadekobot_old 1>/dev/null 2>&1

# make a new backup
mv -fT nadekobot nadekobot_old 1>/dev/null 2>&1

# clone new version
git clone -b v4 --recursive --depth 1 https://gitlab.com/Kwoth/nadekobot

wget -q -N https://gitlab.com/Kwoth/nadeko-bash-installer/-/raw/v4/rebuild.sh
bash rebuild.sh

cd "$root"
rm "$root/n-download.sh"
exit 0
