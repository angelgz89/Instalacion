#! /bin/bash

#########################
#Mantenimiento
#########################

function actualizarlimpiar ()
{
	echo -e "${turquesa}Actualizando el sistema... ${endColour}"
	sudo apt update -y > /dev/null 2>&1
	sudo apt full-upgrade -y > /dev/null 2>&1
	sudo apt update -y > /dev/null 2>&1
    apt-get autoremove -y > /dev/null 2>&1
    apt-get autoclean -y > /dev/null 2>&1
	sudo apt --fix-broken install -y > /dev/null 2>&1
    find /var/log -type f -delete > /dev/null 2>&1
    rm -rf /usr/share/man/* > /dev/null 2>&1

    #rm -rf ~/.local/share/Trash/*
    # sudo rm -rf /tmp/*
    # sudo rm -vfr /tmp/* >/dev/null 2>&1
    # rm -vfr /var/tmp/* >/dev/null 2>&1
	# sudo apt unattended-upgrades
	# sudo dpkg-reconfigure --priority=low unattended-upgrades
	echo -e "${verde}Sistema actualizado ${endColour}"
}

function configuraWOL ()
{
    sudo dmesg | grep VirtualBox > /dev/null 2>&1
    if [ "$(echo $?)" == "1" ];
    then
        echo interfaz para configurar WOL?
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
    fi
}

function Video-dummy ()
{
    sudo apt install xserver-xorg-video-dummy -y > /dev/null 2>&1
    cd /usr/share/X11/xorg.conf.d/
    sudo touch xorg.conf
    sudo chmod g+w,o+w xorg.conf 
    echo '
    Section "Monitor"
    Identifier "Monitor0"
    HorizSync 28.0-80.0
    VertRefresh 48.0-75.0
    Modeline "1920x1080_60.00" 172.80 1920 2040 2248 2576 1080 1081 1084 1118 -HSync +Vsync

    EndSection
        Section "Device"
        Identifier "Card0"
        Driver "dummy"
        VideoRam 256000
    EndSection

    Section "Screen"
        DefaultDepth 24
        Identifier "Screen0"
        Device "Card0"
        Monitor "Monitor0"
        SubSection "Display"
            Depth 24
            Modes "1920x1080_60.00"
        EndSubSection
    EndSection' > xorg.conf
    cd ~
}

function reiniciarSSH ()
{
    sudo /etc/init.d/ssh restart
    sleep 1s
}

function reiniciarSAMBA ()
{
    sudo /etc/init.d/smbd restart
    sleep 1s
}

function carpetascompartidasSMB ()
{
    clear
    testparm
}