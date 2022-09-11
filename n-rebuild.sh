#!/bin/sh
root=$(pwd)

# remove old backup
rm -rf nadekobot_old 1>/dev/null 2>&1

# make a new backup
cp -rT nadekobot nadekobot_old 1>/dev/null 2>&1

wget -q -N https://gitlab.com/Kwoth/nadeko-bash-installer/-/raw/v4/rebuild.sh
bash rebuild.sh

cd "$root"
rm "$root/n-rebuild.sh"
exit 0

