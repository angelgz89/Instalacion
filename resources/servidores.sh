#! /bin/bash

function Mosquitto () 
{
    sudo dpkg -l | grep -i "mosquitto" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ]
	then
        sudo apt install python3 python3-pip -y > /dev/null 2>&1
        sudo pip3 install paho-mqtt > /dev/null 2>&1

		sudo apt install mosquitto mosquitto-clients -y > /dev/null 2>&1
		echo -e "${amarillo}[*]${endColour}${verde} Mosquitto Instalado${endColour}"
	fi
}

function Webmin () 
{
	sudo dpkg -l | grep -i "webmin" > /dev/null 2>&1
	if [ "$(echo $?)" == "1" ];
	then
		actualizarlimpiar
        sudo wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
        sudo apt install webmin -y > /dev/snull 2>&1
        sudo /usr/share/webmin/changepass.pl /etc/webmin root 12AP3Nagz!
        # sudo nano -w /etc/webmin/miniserv.conf
		echo -e "${amarillo}[*]${endColour}${verde} Webmin Instalado${endColour}"
	fi
}

function VNC ()
{
    sudo dmesg | grep VirtualBox > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        sudo dpkg -l | grep -i "vnc-server" > /dev/null 2>&1
        if [ "$(echo $?)" == "1" ];
        then
            wget https://www.realvnc.com/download/file/vnc.files/VNC-Server-6.8.0-Linux-x64.deb
            sudo dpkg -i VNC-Server-6.8.0-Linux-x64.deb > /dev/null 2>&1
            #sudo /etc/vnc/vncelevate "Enable VNC Server Service Mode" /etc/vnc/vncservice start vncserver-x11-serviced
            sudo rm -R VNC-Server-6.8.0-Linux-x64.deb
            sudo apt update -y
            echo -e "${amarillo}[*]${endColour}${verde} VNC Instalado ${endColour}"
        fi
    fi
}

function Docker ()
{
    sudo dpkg -l | grep -i "docker" > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        sudo apt-get remove docker docker-engine docker.io containerd runc
        sudo apt-get update -y 
        sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release 
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
        sudo apt-get update -y
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io
        sudo apt-get update -y

        #Docker compose
        sudo apt install docker-compose -y > /dev/null 2>&1

        echo -e "${amarillo}[*]${endColour}${verde} Docker Instalado ${endColour}"

        #Kubernetes
        echo "Instalar kubernetes? (s/n)"
        read a
        if [ $a == "s" ];
        then
            sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl > /dev/null 2>&1
            curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
            echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
            sudo apt-get update -y > /dev/null 2>&1
            sudo apt-get install -y kubectl > /dev/null 2>&1
            echo -e "${amarillo}[*]${endColour}${verde} Kubernetes Instalado ${endColour}"
        fi
    fi
}