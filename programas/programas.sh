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

function login ()
{
    clear
    echo -e "${VIOLETA}Por favor, introduce la contraseña de administrador: ${endColour}"
    read -s cont
    clear
    echo $cont | sudo -S -v > /dev/null 2>&1

    #MAQUINA VIRTUAL
    sudo dmesg | grep VirtualBox > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ];
    then
        sudo dpkg -l | grep -i "virtualbox-guest-x11" > /dev/null 2>&1
        if [ "$(echo $?)" == "1" ];
        then
            sudo apt install virtualbox-guest-dkms virtualbox-guest-x11 -y > /dev/null 2>&1
            sudo apt-get install build-essential gcc make perl dkms -y > /dev/null 2>&1
            echo -e "${AMARILLO}[*]${endColour}${VERDE} Guest Additions Instaladas${endColour}"
        fi
    fi

    git config --global user.name angelgz89
    git config --global user.email agz2712@gmail.com
}

function Basicos () 
{
    sudo apt install openssh-client openssh-server openssh-sftp-server sshpass -y > /dev/null 2>&1

    sudo apt install python3 python3-pip -y > /dev/null 2>&1
    sudo pip3 install gspread > /dev/null 2>&1
	sudo pip3 install selenium > /dev/null 2>&1
	sudo pip3 install oauth2client > /dev/null 2>&1
	sudo pip3 install python-dateutil > /dev/null 2>&1

    #######################################################################################
    sudo dpkg -l | grep -i "git-man" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install git -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} GIT Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} GIT ya está instalado ${endColour}"
    fi

    #######################################################################################
    sudo dpkg -l | grep -i "lm-sensors" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install rsync -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Rsync Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Rsync ya está instalado ${endColour}"
    fi

    #######################################################################################
    sudo dpkg -l | grep -i "wget" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install wget -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} WGET Instalado ${endColour}"
	else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} WGET ya está instalado ${endColour}"
    fi

    #######################################################################################
    sudo dpkg -l | grep -i "lm-sensors" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt-get install lm-sensors -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Sensors Instalado ${endColour}"
	else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Sensors ya está instalado ${endColour}"
    fi

    #######################################################################################
	sudo dpkg -l | grep -i "binutils" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install binutils -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Binutils Instalado ${endColour}"
	else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Binutils ya está instalado ${endColour}"
	fi

    #######################################################################################
	sudo dpkg -l | grep -i "wakeonlan" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install wakeonlan -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} WakeOnLan Instalado ${endColour}"
	else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} WakeOnLan ya está instalado ${endColour}"
	fi

    #######################################################################################
	sudo dpkg -l | grep -i "chromium-chromedriver" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install chromium-driver -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Chronium-driver Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Chronium-driver ya está instalado ${endColour}"
	fi

    #######################################################################################
	sudo dpkg -l | grep -i "net-tools" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install net-tools -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Net-tools Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Net-tools ya está instalado ${endColour}"
	fi

    # sudo dpkg -l | grep -i "" > /dev/null 2>&1
	# if [ "$(echo $?)" == "1" ]
	# then

    # fi

    #sudo apt-get install build-essential gcc make perl dkms -y > /dev/null 2>&1
    #sudo apt install software-properties-common apt-transport-https -y > /dev/null 2>&1
    #echo -e "${AMARILLO}[*]${endColour}${VERDE} Accesorios Instalados${endColour}"
}

function ZSH () 
{
    sudo apt install git zsh zsh-antigen -y > /dev/null 2>&1
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null 2>&1
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1

    cp $HOME/Instalacion/resources/.zshrc $HOME

    echo $cont | sudo -S chsh -s $(which zsh)
}

function BTOP ()
{
    mkdir ~/btop
    cd ~/btop
    if [ $(uname -m) == "x86_64" ];
    then
        wget https://github.com/aristocratos/btop/releases/download/v1.0.24/btop-1.0.24-x86_64-linux-musl.tbz > /dev/null 2>&1
        tar -xjf btop-1.0.24-x86_64-linux-musl.tbz > /dev/null 2>&1
    fi

    if [ $(uname -m) == "armv7l" ];
    then
        wget https://github.com/aristocratos/btop/releases/download/v1.0.24/btop-1.0.24-armv7l-linux-musleabihf.tbz > /dev/null 2>&1
        tar -xjf btop-1.0.24-armv7l-linux-musleabihf.tbz > /dev/null 2>&1
    fi
    ./install.sh > /dev/null 2>&1
    cd ..
    rm -R btop
    echo -e "${AMARILLO}[*]${endColour}${VERDE} Btop Instalado${endColour}"
}

function Cockpit ()
{
    sudo dpkg -l | grep -i "cockpit" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install cockpit -y > /dev/null 2>&1
        echo $cont | sudo -S systemctl restart cockpit
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Cockpit Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Cockpit ya está instalado ${endColour}"
    fi
}

function Neofetch () 
{
    sudo dpkg -l | grep -i "neofetch" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install neofetch -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Neofetch Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Neofetch ya está instalado ${endColour}"
    fi
}

function Sublime () 
{
	sudo dpkg -l | grep -i "sublime" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		actualizarlimpiar
		wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
		sudo apt-get install apt-transport-https -y > /dev/null 2>&1
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
		actualizarlimpiar
		sudo apt install sublime-text -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Sublime Text Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Sublime ya está instalado ${endColour}"
	fi
}

function Transmission () 
{
	sudo dpkg -l | grep -i "transmission" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
        sudo apt install transmission -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Transmission Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Transmission ya está instalado ${endColour}"
	fi
}

function Onedriver ()
{
	sudo add-apt-repository ppa:jstaf/onedriver -y > /dev/null 2>&1
    sudo apt update -y > /dev/null 2>&1
    sudo apt install onedriver -y > /dev/null 2>&1
	echo -e "${AMARILLO}[*]${endColour}${VERDE} Onedriver Instalado ${endColour}"
}

function Synaptic () 
{
    sudo dpkg -l | grep -i "synaptic" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install synaptic -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Synaptic Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Synaptic ya está instalado ${endColour}"
    fi
}

function Temas () 
{
    sudo dpkg -l | grep -i "papirus-icon-theme" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        sudo add-apt-repository ppa:papirus/papirus -y > /dev/null 2>&1
        sudo apt update -y > /dev/null 2>&1
        sudo apt install papirus-icon-theme -y > /dev/null 2>&1
    fi

	DIRECTORIO="$PWD/.themes/WhiteSur-gtk-theme"
	if [ -d "$DIRECTORIO" ]
	then
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Los temas ya está instalados ${endColour}"
	else
		sudo apt install sassc libglib2.0-dev-bin -y > /dev/null 2>&1

		mkdir ~/.themes
		mkdir ~/.icons
		cd ~/.themes/

		git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git > /dev/null 2>&1
		cd WhiteSur-gtk-theme/
		
		sudo apt update -y > /dev/null 2>&1
		sudo chmod 777 install.sh
		sudo ./install.sh > /dev/null 2>&1
		sudo ./install.sh -c dark -c light > /dev/null 2>&1
		sudo ./install.sh -i simple > /dev/null 2>&1
		cd ~/
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Temas Instalados ${endColour}"
	fi
}

function Gnome-tweaks ()
{
    sudo dpkg -l | grep -i "gnome-tweak-tool" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        sudo apt-get install gnome-tweak-tool -y > /dev/null 2>&1
        sudo apt install gnome-shell-extensions chrome-gnome-shell -y > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Gnome-tweak-tool Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Gnome-tweak-tool ya está instalado ${endColour}"
    fi
}

function Plank () 
{
	sudo dpkg -l | grep -i "plank" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt-get install plank -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Plank Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Plank ya está instalado ${endColour}"
	fi
}

function Tilix () 
{
	sudo dpkg -l | grep -i "tilix" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install -y tilix > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Tilix Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Tilix ya está instalado ${endColour}"
	fi
}

function Stacer () 
{
	sudo dpkg -l | grep -i "stacer" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install stacer -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Stacer Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Stacer ya está instalado ${endColour}"
	fi
}

function Gparted () 
{
	sudo dpkg -l | grep -i "gparted" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gparted -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Gparted Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Gparted ya está instalado ${endColour}"
	fi
}

function VisualStudio ()
{
    sudo dpkg -l | grep -i "Code editing" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        #Visual Studio Code
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - > /dev/null 2>&1
        sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /dev/null 2>&1
        sudo apt install -y code > /dev/null 2>&1
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Visual Studio Code Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Visual Studio Code ya está instalado ${endColour}"
    fi
}

function Veracrypt ()
{
    sudo dpkg -l | grep -i "veracrypt" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
        sudo dpkg -i veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb > /dev/null 2>&1
        sudo rm -R veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb

        actualizarlimpiar
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Veracrypt Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Veracrypt ya está instalado ${endColour}"
    fi
}

function Nomacs () 
{
	sudo dpkg -l | grep -i "nomacs" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install nomacs -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Nomacs Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Nomacs ya está instalado ${endColour}"
	fi
}

function Utilidaddiscos () 
{
	sudo dpkg -l | grep -i "gnome-disk-utility" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gnome-disk-utility -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Utilidad de discos Instalada ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Utilidad de discos ya está instalado ${endColour}"
	fi
}

function Monitorsistema () 
{
	sudo dpkg -l | grep -i "gnome-system-monitor" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gnome-system-monitor -y > /dev/null 2>&1
		echo -e "${AMARILLO}[*]${endColour}${VERDE} Monitor de sistema Instalado ${endColour}"
    else
        echo -e "${AMARILLO}[*]${endColour}${VERDE} Monitor de sistema ya está instalado ${endColour}"
	fi
}

#########################