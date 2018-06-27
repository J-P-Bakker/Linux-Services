#!/bin/sh
#installing Nagios monitor server

#Installing prereqs
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev

#Adding user and group
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagios,nagcmd www-data

#Downloading Nagios core
cd ~
sudo wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.3.4.tar.gz
sudo tar -xzf nagioscore.tar.gz


#Compiling Nagios
cd nagioscore-nagios-4.3.4/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install
sudo make install-init
sudo make install-commandmode
sudo make install-config
sudo update-rc.d Nagios defaults

#Updating apache en add Nagios
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

#Allow firewall
sudo ufw allow apache

#Add nagios webuser and set password (For easy use the password is "Hardcoded")
sudo htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin Welkom123

#Nagios plugin
cd ~
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz
cd nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install
sudo systemctl restart nagios

#Installeing NRPE
cd ~
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz 
tar zxf nrpe-*
cd nrpe-*
sudo ./configure
sudo make check_nrpe
sudo make install-plugin

#Finnished installing

#Remove nagios tar files
sudo rm -rf nagios*.tar.gz
sudo rm -rf nrpe*.tar.gz

#Creating nagios servers folder
sudo mkdir -p /usr/local/nagios/etc/servers
