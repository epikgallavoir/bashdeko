#!/bin/sh
root=$(pwd)

# remove old backup
rm -rf nedakod_old 1>/dev/null 2>&1

# make a new backup
cp -rT nedakod nedakod_old 1>/dev/null 2>&1

wget -q -N https://raw.githubusercontent.com/epikgallavoir/bashdeko/main/rebuild.sh
bash rebuild.sh

cd "$root"
rm "$root/n-rebuild.sh"
exit 0

