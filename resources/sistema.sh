#! /bin/bash

function sist ()
{
	sis=$(env|grep XDG_CURRENT_DESKTOP)

	if [[ $sis = "XDG_CURRENT_DESKTOP=XFCE" ]];
	then
		lsb_release -d | grep "Ubuntu" > /dev/null 2>&1
		if [ "$(echo $?)" == "0" ];
		then
			OSS="Xubuntu"
		fi

		lsb_release -d | grep "Linux Mint" > /dev/null 2>&1
		if [ "$(echo $?)" == "0" ];
		then
			OSS="Mint xfce"
		fi
	fi

    lsb_release -d | grep "Raspbian" > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ];
    then
        OSS="Rasbperry"
    fi

    if [[ $sis = "XDG_CURRENT_DESKTOP=GNOME" ]];
	then
        lsb_release -d | grep "Debian GNU/Linux 11"
		if [ "$(echo $?)" == "0" ];
		then
			OSS="Debian11"
		fi
	fi

	if [[ $sis = "" ]];
	then
		OSS="UbuntuServer"
	fi

	if [[ $sis = "XDG_CURRENT_DESKTOP=Pantheon" ]];
	then
        lsb_release -d | grep "elementary OS 5"
		if [ "$(echo $?)" == "0" ];
		then
		    OSS="ElementaryOS5"
        fi
        lsb_release -d | grep "elementary OS 6"
		if [ "$(echo $?)" == "0" ];
		then
		    OSS="ElementaryOS6"
        fi
	fi

	if [[ $sis = "XDG_CURRENT_DESKTOP=ubuntu:GNOME" ]];
	then
		OSS="Ubuntu"
	fi
}

#########################

function Sistemas ()
{
    echo -e "${lila}En que sistema operativo estas?" $OSS "${endColour}"
    echo -e "${verde}Xubuntu, Debian11, Rasbperry, Rasbperry Lite, Mint xfce, UbuntuServer" $OSS "${endColour}"
    read OSS
    clear

    echo -e "${lila}Instalando programas para" $OSS "${endColour}"
    echo -e "${turquesa}Eliminando programas preinstalados...${endColour}"

    if [[ $OSS == "Xubuntu" ]]
    then
        
        sudo apt remove --purge -y onboard mousepad gnome-font-viewer gucharmap info libreoffice-base-core xfburn atril xfce4-dict xfce4-taskmanager pidgin xfce4-screenshooter thunderbird catfish gnome-sudoku gnome-mines sgt-launcher ristretto gimp simple-scan > /dev/null 2>&1
        sudo add-apt-repository ppa:xubuntu-dev/staging -y > /dev/null 2>&1

        Basicos
        Nomacs
        Utilidaddiscos
        Monitorsistema
        Gparted
        Plank
        Tilix
        Stacer
        Sublime
        Transmission
        Temas

        actualizarlimpiar
    fi

    if [[ $OSS == "Debian11" ]]
    then
        sudo apt remove --purge -y libreoffice-common tali gnome-taquin gnome-maps gnome-weather gnome-sudoku gnome-robots gnome-tetravex gnome-nibbles quadrapassel swell-foop aisleriot gnome-mahjongg

        actualizarlimpiar
    
    fi

    if [[ $OSS == "Rasbperry" ]]
    then
        sudo apt remove --purge thonny -y 
        sudo apt remove --purge geany -y
        actualizarlimpiar
        sudo apt dist-upgrade -y 
        sudo rpi-update -y
        Basicos
        actualizarlimpiar
    fi

    if [[ $OSS == "Rasbperry Lite" ]]
    then
        sudo apt dist-upgrade -y > /dev/null 2>&1
        sudo rpi-update -y > /dev/null 2>&1
        Basicos
        actualizarlimpiar
    fi

    if [[ $OSS == "Mint xfce" ]]
    then
        sudo apt remove --purge -y libreoffice-core libreoffice-common libreoffice-base-core onboard mintreport drawing sticky hypnotix simple-scan hexchat xfce4-dict xed gnome-font-viewer xreader thunderbird gnome-logs redshift-gtk gucharmap -y > /dev/null 2>&1
        Basicos
        actualizarlimpiar
        
    fi

    if [[ $OSS == "UbuntuServer" ]]
    then
        Basicos
    fi

    if [[ $OSS == "Ubuntu" ]]
    then
        Basicos
    fi

    if [[ $OSS == "ElementaryOS6" ]]
    then
        Basicos
        sudo apt install software-properties-common -y > /dev/null 2>&1
        sudo add-apt-repository ppa:philip.scott/pantheon-tweaks -y > /dev/null 2>&1
        actualizarlimpiar
        sudo apt-get install pantheon-tweaks -y > /dev/null 2>&1

        sudo apt remove --purge epiphany-browser -y > /dev/null 2>&1
        sudo apt install firefox -y > /dev/null 2>&1

        actualizarlimpiar

        sudo apt-get install build-essential module-assistant -y > /dev/null 2>&1
        sudo m-a prepare -y > /dev/null 2>&1
        sudo apt install libgconf2-dev libpolkit-gobject-1-dev libswitchboard-2.0-dev elementary-sdk -y > /dev/null 2>&1
    fi
}