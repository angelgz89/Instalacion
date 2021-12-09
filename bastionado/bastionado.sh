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
    sudo cp $HOME/Installs/resources/sshd_config /etc/ssh/
    sudo systemctl restart ssh
    echo -e "${AMARILLO}[*]${endColour}${VERDE} SSH Bastionado${endColour}"
}

function BastionadoIP6 ()
{
    sudo cp $HOME/Installs/resources/sysctl.conf /etc/sysctl.conf
    sudo cp $HOME/Installs/resources/grub /etc/default/grub
    echo -e "${AMARILLO}[*]${endColour}${VERDE} IP6 Bastionado${endColour}"
}

function BastionadoFail2Ban ()
{
    sudo apt install fail2ban -y > /dev/null 2>&1
    cp $HOME/Installs/resources /etc/fail2ban/jail.conf
    sudo systemctl restart fail2ban
    echo -e "${AMARILLO}[*]${endColour}${VERDE} Fail2Ban Bastionado${endColour}"
}
