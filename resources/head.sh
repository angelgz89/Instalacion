#! /bin/bash
# -*- ENCODING: UTF-8 -*-

# Author: M4h0uT

#Colours
verde="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
rojo="\e[0;31m\033[1m"
turquesa="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
lila="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
gris="\e[0;37m\033[1m"


function login ()
{
    clear
    echo -e "${lila}Por favor, introduce la contraseña de administrador: ${endColour}"
    read -s cont
    clear
    echo $cont | sudo -S -v > /dev/null 2>&1

    #MAQUINA VIRTUAL?
    sudo dmesg | grep VirtualBox > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ];
    then
        sudo dpkg -l | grep -i "virtualbox-guest-x11" > /dev/null 2>&1
        if [ "$(echo $?)" == "1" ];
        then
            sudo apt install virtualbox-guest-dkms virtualbox-guest-x11 -y > /dev/null 2>&1
            sudo apt-get install build-essential gcc make perl dkms -y > /dev/null 2>&1
            echo -e "${amarillo}[*]${endColour}${verde} Guest Additions Instaladas${endColour}"
        fi
    fi

    git config --global user.name angelgz89
    git config --global user.email agz2712@gmail.com

}

