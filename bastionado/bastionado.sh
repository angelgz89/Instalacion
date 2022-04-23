#!/bin/bash

#Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AZUL="\e[0;34m\033[1m"
AMARILLO="\e[0;33m\033[1m"
VIOLETA="\e[0;35m\033[1m"
CYAN="\e[0;36m\033[1m"
GRIS="\e[0;37m\033[1m"
NEGRO="\e[0;30m\033[1m"
endColour="\033[0m\e[0m"

################################################################


function BastionadoSSH ()
{
    sudo touch $HOME/.hushlogin
    sudo cp ./resources/sshd_config /etc/ssh/
    sudo systemctl restart ssh
    echo -e "${AMARILLO}[*]${endColour}${VERDE} SSH Bastionado${endColour}"
}

function BastionadoIP6 ()
{
    sudo cp ./resources/sysctl.conf /etc/sysctl.conf
    sudo cp ./resources/grub /etc/default/grub
    echo -e "${AMARILLO}[*]${endColour}${VERDE} IP6 Bastionado${endColour}"
}

function BastionadoFail2Ban ()
{
    sudo apt install fail2ban -y > /dev/null 2>&1
    cp ./resources /etc/fail2ban/jail.conf
    sudo systemctl restart fail2ban
    echo -e "${AMARILLO}[*]${endColour}${VERDE} Fail2Ban Bastionado${endColour}"
}

function wakeonlan ()
{
    echo interfaz?
    read interfaz

    echo "Por favor, introduce la contraseña de administrador para usar el programa:"
    read -s cont

    echo $cont | sudo -S apt update -y
    sudo apt install ethtool -y
    sudo ethtool -s $interfaz wol g
    sudo apt install wakeonlan -y

    touch wol.service

    echo '[Unit]
    Description=Configure Wake On LAN
    [Service]
    Type=oneshot
    ExecStart=/sbin/ethtool -s '$interfaz' wol g
    [Install]
    WantedBy=basic.target' >> wol.service

    sudo cp wol.service /etc/systemd/system/

    rm -R wol.service

    sudo systemctl daemon-reload
    sudo systemctl enable wol.service
    sudo systemctl start wol.service
}
