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

#########################################################

#Carga de archivos
. $PWD/programas/programas.sh
. $PWD/bastionado/bastionado.sh
. $PWD/mantenimiento/mantenimiento.sh
. $PWD/sistemas/sistemas.sh


#########################################################

function MENU ()
{
    echo "" 
    echo -e "${AMARILLO}---------------------------${endColour}"
    echo -e "${VIOLETA}           MENU    ${endColour}"
    echo -e "${AMARILLO}---------------------------${endColour}"
    echo ""
    echo -e "${CYAN}[1]${endColour}${AZUL} Instalacion Inicial ${endColour}"
    echo -e "${CYAN}[2]${endColour}${AZUL} Instalacion de programas ${endColour}"
    echo -e "${CYAN}[3]${endColour}${AZUL} Mantenimiento ${endColour}"
    echo -e "${CYAN}[4]${endColour}${AZUL} Bastionado ${endColour}"
    echo -e "${CYAN}[0]${endColour}${AZUL} Salir ${endColour}"
    echo "" 
    echo -e "${AMARILLO}---------------------------${endColour}"
    echo -e "${VERDE}Por favor, elige una opción ${endColour}"
    read op

    while [ $op != "0" ] && [ $op != "1" ] && [ $op != "2" ] &&  [ $op != "3" ] && [ $op != "4" ] 
    do
        echo -e "${ROJO}Opcion incorrecta, por favor ingresa una opcion correcta ${endColour}"
        read op
    done

    case "$op" in 
    0)
        Salir;;
    1)
        clear
        echo -e "${VIOLETA}INSTALACION INICIAL ${endColour}"
        echo ""

        Basicos
        sist
        Sistemas

        MENU;;
    2)
        clear
        echo -e "${VIOLETA}INSTALACION DE PROGRAMAS ${endColour}"
        echo ""

        echo -e "${AZUL}Que programa quieres instalar? ${endColour}"
        read prog
        $prog

        MENU;;
    3)
        clear
        echo -e "${VIOLETA}MANTENIMIENTO ${endColour}"
        echo ""

        echo -e "${AZUL}Que accion quieres realizar? ${endColour}"
        read mant
        $mant

        MENU;;
    4)
        clear
        echo -e "${VIOLETA}BASTIONADO${endColour}"
        echo ""

        BastionadoSSH
        
        MENU;;
    esac
}

function Salir ()
{

    clear
    actualizarlimpiar
    clear
    echo -e "${VERDE}Gracias por utilizar el programa ${endColour}"
    echo -e "${VERDE}Hasta luego! ${endColour}"
    echo ""
    
    sudo dpkg -l | grep -i "docker" > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ];
    then
        sudo usermod -aG docker $USER
        newgrp docker
    fi

    return 0
}

#########################################################

#Login
login

#Menu
MENU

#########################################################

# sudo reboot