#!/bin/sh
#installing Nagios monitor server

#Installing prereqs
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.0 libgd2-xpm-dev

#Adding user and group
sudo useradd nagios
sudo usermod -a -G nagios www-data

#Downloading Nagios core
wget -q -O /tmp/nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.3.4.tar.gz
cd /tmp
tar -xzf nagioscore.tar.gz >/dev/null 2>&1


#Compiling Nagios
cd /tmp/nagioscore-nagios-4.3.4/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all

sudo make install
sudo make install-init
sudo update-rc.d Nagios defaults
sudo make install-commandmode
sudo make install-config


#Updating apache en add Nagios
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

#Allow firewall
sudo ufw allow apache

#Add nagios webuser and set password (For easy use the password is "Hardcoded")
sudo htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin Welkom123

#Restart services
sudo systemctl restart apache2
sudo systemctl start nagios

echo "-------------------------------------------------------------------------------------"
echo "Nagios has been installed and configured"
echo "Installing nagios plugins"
echo "-------------------------------------------------------------------------------------"

#Nagios plugin
sudo apt-get install -y -q autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext
wget --no-check-certificate -O /tmp/nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
cd /tmp

tar zxf nagios-plugins.tar.gz
cd /tmp/nagios-plugins-release-2.2.1/

sudo ./tools/setup
sudo ./configure
sudo make
sudo make install
sudo systemctl restart nagios

#Installeing NRPE
cd /tmp
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz 
tar zxf nrpe-*
cd /tmp/nrpe-*
sudo ./configure
sudo make check_nrpe
sudo make install-plugin

#Finnished installing
echo "-------------------------------------------------------------------------------------"
echo "Nagios plugins have been installed and configured"
echo "-------------------------------------------------------------------------------------"
#Remove nagios tar files
sudo rm -rf /tmp/nagios*.tar.gz
sudo rm -rf /tmp/nrpe*.tar.gz

#Creating nagios servers folder
sudo mkdir -p /usr/local/nagios/etc/servers
echo "-------------------------------------------------------------------------------------"
echo "Finished removing old files"
echo "-------------------------------------------------------------------------------------"
