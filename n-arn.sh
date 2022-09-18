#!/bin/sh
echo "Running nedakoc"
root=$(pwd)

choice=4
    clear

if hash dotnet 2>/dev/null
then
    echo "Dotnet is installed."
    echo ""
else
    echo "Dotnet is not installed. Please install preqrequisites (option 1)."
    exit 1
fi

    echo "1. Run Auto Restart and update nedakoc."
    echo "2. Run Auto Restart normally without updating nedakoc."
    echo "3. Exit"
    echo ""
    echo "Choose:"
    echo "[1] to Run with Auto Updating on restart after using \"die\" command."
    echo "[2] to Run nedakoc with Auto Restart on \"die\" command without updating."

while [ $choice -eq 4 ]; do
read choice
    if [ $choice -eq 1 ] ; then
        echo ""
        echo "Running nedakoc with auto update. Please wait. . ."
        while :; do cd $root/nedakoc/output && dotnet NadekoBot.dll ; youtube-dl -U && cd $root && wget -N https://raw.githubusercontent.com/epikgallavoir/bashdeko/main/n-download.sh && bash "$root/n-download.sh"; sleep 5s; done
        echo "Done"
    elif [ $choice -eq 2 ] ; then
        echo ""
        echo "Running nedakoc without auto update. Please wait. . ."
        while :; do cd "$root/nedakoc/output" && dotnet NadekoBot.dll && youtube-dl -U; sleep 5s; done
        echo "Done"
    elif [ "$choice" -eq 3 ] ; then
        echo ""
        echo "Exiting..."
        cd "$root"
        exit 0
    else
        echo "Invalid choice"
        sleep 3s
        echo ""
        clear
        echo "1. Run Auto Restart and update nedakoc."
        echo "2. Run Auto Restart normally without updating nedakoc."
		echo "3. Exit"
		echo ""
		echo "Choose:"
		echo "[1] to Run with Auto Updating on restart after using \"die\" command."
		echo "[2] to Run nedakoc with Auto Restart on \"die\" command without updating."
        choice=4
    fi
done

cd "$root"
rm "$root/n-arn.sh"
exit 0
