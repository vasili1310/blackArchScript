#!/bin/bash

clear

echo "Installing BlackArch on top of your Arch system..."

sleep 3

curl -O https://blackarch.org/strap.sh
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu --noconfirm

clear

read -p "Do you want to automatically install some useful tools (~40GB)? (y/n) " -n 1 -r
echo
case "$REPLY" in
    [Yy]) 
        echo "Installing..."
        sudo pacman -S blackarch-webapp blackarch-proxy blackarch-disassembler blackarch-networking blackarch-forensic blackarch-crypto blackarch-wireless blackarch-binary blackarch-reversing blackarch-malware blackarch-wordlist blackarch-debugger blackarch-stego
        # yes action
        ;;
    [Nn])
        echo "Okay, not installing"
        printf "\n"
        # no action
        ;;
    *)
        echo "Invalid input, not installing"
        printf "\n"
        # handle invalid input
        ;;
esac

echo "BlackArch is now installed!"
printf "\n"
echo "You can see available categories with:"
echo "sudo pacman -Sg | grep blackarch"

printf "\n"
echo "You can install a category of tools with:"
echo "sudo pacman -S blackarch-<category>"
