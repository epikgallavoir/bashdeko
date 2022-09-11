#!/bin/sh

echo "Welcome to nedakoc, a fork (skid) of NadekoBot"
echo ""

root=$(pwd)
choice=9
    
base_url="https://github.com/epikgallavoir/bashdeko"

script_menu="n-menu.sh"
script_prereq="n-prereq.sh"
script_install="n-download.sh"
script_run="n-run.sh"
script_arn="n-arn.sh"
script_rebuild="n-rebuild.sh"

while [ $choice -eq 9 ]; do

    echo "1. Install Prerequisites"
    echo "2. Download nedakoc"
    echo "3. Run nedakoc"
    echo "4. Run nedakoc with Auto Restart in this session"
    echo "5. Rebuild nedakoc"
    echo "6. Exit"
    echo -n "Type in the number of an option and press ENTER"
    echo ""
    read choice

    if [[ $choice -eq 1 ]] ; then
        echo ""
        echo "Downloading the prerequisites installer script"
        rm "$root/$script_prereq" 1>/dev/null 2>&1
        wget -N "$base_url/$script_prereq" && bash "$root/$script_prereq"
        echo ""
        choice=9
    elif [[ $choice -eq 2 ]] ; then
        echo ""
        echo "Downloading the nedakoc installer script"
        rm "$root/$script_install" 1>/dev/null 2>&1
        wget -N "$base_url/$script_install" && bash "$root/$script_install"
        echo ""
        sleep 2s
        choice=9
    elif [[ $choice -eq 3 ]] ; then
        echo ""
        echo "Downloading the nedakoc run script"
        rm "$root/$script_run" 1>/dev/null 2>&1
        wget -N "$base_url/$script_run" && bash "$root/$script_run"
        echo ""
        sleep 2s
        bash "$root/linuxAIO.sh"
    elif [[ $choice -eq 4 ]] ; then
        echo ""
        echo "Downloading the nedakoc run and auto restart script"
        rm "$root/$script_arn" 1>/dev/null 2>&1
        wget -N "$base_url/$script_arn" && bash "$root/$script_arn"
        echo ""
        sleep 2s
        bash "$root/linuxAIO.sh"
    elif [[ $choice -eq 5 ]]; then
        echo ""
        echo "Downloading the nedakoc rebuild script"
        rm "$root/$script_rebuild" 1>/dev/null 2>&1
        wget -N "$base_url/$script_rebuild" && bash "$root/$script_rebuild"
        echo ""
        sleep 2s
        choice=9
    elif [[ $choice -eq 6 ]] ; then
        echo ""
        echo "Exiting..."
        cd "$root"
        exit 0
    elif [[ $choice -eq 6 ]] ; then
        echo ""
        echo "Downloading the nedakoc rebuild script"
        rm "$root/$script_rebuild" 1>/dev/null 2>&1
        wget -N "$base_url/$script_rebuild" && bash "$root/$script_rebuild"
        echo ""
        sleep 2s
        choice=9
    else
        echo "Invalid choice"
        echo ""
        choice=9
    fi
done

cd "$root"
exit 0
