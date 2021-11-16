#########################
#PROGRAMAS
#########################

function Basicos () 
{
    sudo apt install python3 python3-pip -y > /dev/null 2>&1
    sudo pip3 install gspread > /dev/null 2>&1
	sudo pip3 install selenium > /dev/null 2>&1
	sudo pip3 install oauth2client > /dev/null 2>&1
	sudo pip3 install python-dateutil > /dev/null 2>&1
    echo -e "${amarillo}[*]${endColour}${verde} Python Instalado${endColour}"

    sudo apt install openssh-client openssh-server openssh-sftp-server -y > /dev/null 2>&1
    sudo apt install sshpass -y > /dev/null 2>&1
	sudo touch ~/.hushlogin
    echo -e "${amarillo}[*]${endColour}${verde} SSH Instalado${endColour}"

    sudo apt install git -y > /dev/null 2>&1
    echo -e "${amarillo}[*]${endColour}${verde} GIT Instalado${endColour}"

    sudo apt install rsync -y > /dev/null 2>&1
    echo -e "${amarillo}[*]${endColour}${verde} Rsync Instalado${endColour}"

    sudo apt install wget -y > /dev/null 2>&1
    echo -e "${amarillo}[*]${endColour}${verde} WGET Instalado${endColour}"

    sudo dpkg -l | grep -i "lm-sensors" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt-get install lm-sensors -y > /dev/null 2>&1
        echo -e "${amarillo}[*]${endColour}${verde} Sensors Instalado${endColour}"
	else
        echo -e "${amarillo}[*]${endColour}${verde} Sensors ya está instalado ${endColour}"
    fi

	sudo dpkg -l | grep -i "binutils" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install binutils -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Binutils Instalado${endColour}"
	else
        echo -e "${amarillo}[*]${endColour}${verde} Binutils ya está instalado ${endColour}"
	fi

	sudo dpkg -l | grep -i "wakeonlan" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install wakeonlan -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} WakeOnLan Instalado${endColour}"
	else
        echo -e "${amarillo}[*]${endColour}${verde} WakeOnLan ya está instalado ${endColour}"
	fi

	sudo dpkg -l | grep -i "chromium-chromedriver" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install chromium-driver -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Chronium-driver Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Chronium-driver ya está instalado ${endColour}"
	fi

	sudo dpkg -l | grep -i "net-tools" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
		sudo apt install net-tools -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Net-tools Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Net-tools ya está instalado ${endColour}"
	fi

    sudo dpkg -l | grep -i "cockpit" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install cockpit -y > /dev/null 2>&1
        echo $cont | sudo -S systemctl restart cockpit
        echo -e "${amarillo}[*]${endColour}${verde} Cockpit Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Cockpit ya está instalado ${endColour}"
    fi

	sudo dpkg -l | grep -i "zsh" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install -y zsh > /dev/null 2>&1
		wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
		sudo git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null 2>&1
		sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null 2>&1
		echo ' ' > .zshrc
		echo '
		export ZSH=$HOME/.oh-my-zsh

		ZSH_THEME="bira"

		plugins=(git
		zsh-autosuggestions
		zsh-syntax-highlighting
		)
		source $ZSH/oh-my-zsh.sh
		
		export PATH="$PATH:$HOME/Scripts/Linux"' > .zshrc

		echo $cont | chsh -s `which zsh`

		echo -e "${amarillo}[*]${endColour}${verde} ZSH Instalado${endColour}"
	else
        echo -e "${amarillo}[*]${endColour}${verde} ZSH ya está instalado ${endColour}"
	fi

    # sudo dpkg -l | grep -i "" > /dev/null 2>&1
	# if [ "$(echo $?)" == "1" ]
	# then

    # fi

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
    echo -e "${amarillo}[*]${endColour}${verde} Btop Instalado${endColour}"

    #sudo apt-get install build-essential gcc make perl dkms -y > /dev/null 2>&1
    #sudo apt install software-properties-common apt-transport-https -y > /dev/null 2>&1
    #echo -e "${amarillo}[*]${endColour}${verde} Accesorios Instalados${endColour}"
}

function Neofetch () 
{
    sudo dpkg -l | grep -i "neofetch" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install neofetch -y > /dev/null 2>&1
        echo -e "${amarillo}[*]${endColour}${verde} Neofetch Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Neofetch ya está instalado ${endColour}"
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
		echo -e "${amarillo}[*]${endColour}${verde} Sublime Text Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Sublime ya está instalado ${endColour}"
	fi
}

function Transmission () 
{
	sudo dpkg -l | grep -i "transmission" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
        sudo apt install transmission -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Transmission Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Transmission ya está instalado ${endColour}"
	fi
}

function Onedriver ()
{
	sudo add-apt-repository ppa:jstaf/onedriver -y > /dev/null 2>&1
    sudo apt update -y > /dev/null 2>&1
    sudo apt install onedriver -y > /dev/null 2>&1
	echo -e "${amarillo}[*]${endColour}${verde} Onedriver Instalado${endColour}"
}

function Synaptic () 
{
    sudo dpkg -l | grep -i "synaptic" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install synaptic -y > /dev/null 2>&1
        echo -e "${amarillo}[*]${endColour}${verde} Synaptic Instalado${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Synaptic ya está instalado ${endColour}"
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
		echo -e "${amarillo}[*]${endColour}${verde} Los temas ya está instalados ${endColour}"
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
		echo -e "${amarillo}[*]${endColour}${verde} Temas Instalados ${endColour}"
	fi
}

function Gnome-tweaks ()
{
    sudo dpkg -l | grep -i "gnome-tweak-tool" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        sudo apt-get install gnome-tweak-tool -y > /dev/null 2>&1
        sudo apt install gnome-shell-extensions chrome-gnome-shell -y > /dev/null 2>&1
        echo -e "${amarillo}[*]${endColour}${verde} Gnome-tweak-tool Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Gnome-tweak-tool ya está instalado ${endColour}"
    fi
}

function Plank () 
{
	sudo dpkg -l | grep -i "plank" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt-get install plank -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Plank Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Plank ya está instalado ${endColour}"
	fi
}

function Tilix () 
{
	sudo dpkg -l | grep -i "tilix" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install -y tilix > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Tilix Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Tilix ya está instalado ${endColour}"
	fi
}

function Stacer () 
{
	sudo dpkg -l | grep -i "stacer" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install stacer -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Stacer Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Stacer ya está instalado ${endColour}"
	fi
}

function Gparted () 
{
	sudo dpkg -l | grep -i "gparted" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gparted -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Gparted Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Gparted ya está instalado ${endColour}"
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
        echo -e "${amarillo}[*]${endColour}${verde} Visual Studio Code Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Visual Studio Code ya está instalado ${endColour}"
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
        echo -e "${amarillo}[*]${endColour}${verde} Veracrypt Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Veracrypt ya está instalado ${endColour}"
    fi
}

function Nomacs () 
{
	sudo dpkg -l | grep -i "nomacs" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install nomacs -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Nomacs Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Nomacs ya está instalado ${endColour}"
	fi
}

function Utilidaddiscos () 
{
	sudo dpkg -l | grep -i "gnome-disk-utility" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gnome-disk-utility -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Utilidad de discos Instalada ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Utilidad de discos ya está instalado ${endColour}"
	fi
}

function Monitorsistema () 
{
	sudo dpkg -l | grep -i "gnome-system-monitor" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		sudo apt install gnome-system-monitor -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Monitor de sistema Instalado ${endColour}"
    else
        echo -e "${amarillo}[*]${endColour}${verde} Monitor de sistema ya está instalado ${endColour}"
	fi
}


#########################