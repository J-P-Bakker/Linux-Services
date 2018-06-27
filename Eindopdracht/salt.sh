#!/bin/sh
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.
# Script voor installeren salt op Master of Minion

read -p "Wilt u een Master of Minion installeren: " SALT_TYPE

while [ "$SALT_TYPE" != "Master" ] && [ "$SALT_TYPE" != "Minion" ]
do
	echo "Er is geen correcte sorteer methode gekozen"
	while [ "$DOORGAAN_KEUZE" != "n" ] && [ "$DOORGAAN_KEUZE" != "y" ]
    do
    	read -p "Wilt u verder gaan? [y/n]: " DOORGAAN_KEUZE

		if [ "$DOORGAAN_KEUZE" = "n" ]; then
			exit
		elif [ "$DOORGAAN_KEUZE" = "y" ]; then
			:
		else
			echo "Geen geldige optie was gekozen"
		fi
	done
	DOORGAAN_KEUZE='NULL'
	read -p "Kies Master of Minion: " SALT_TYPE
done

if [ "$SALT_TYPE" = "Master" ]; then
	#install master
	cd /home/jbakker/
	curl -L https://bootstrap.saltstack.com -o install_salt.sh
	sudo sh install_salt.sh -M

	echo "-------------------------------------------------------------------------------------"
	echo "Salt Master has been installed"
	echo "-------------------------------------------------------------------------------------"
	
	#Move Salt States to Salt folder
	sudo mkdir /srv/salt
	cd "/home/jbakker//Linux-Services/Eindopdracht/Salt States/"
	sudo cp * /srv/salt/
	cd /home/jbakker/
	echo "-------------------------------------------------------------------------------------"
	echo "Salt States have been moved"
	echo "-------------------------------------------------------------------------------------"
	

	#Master as minion
	read -p "Wilt u de master als minion? [y/n]: " DOORGAAN_KEUZE
	while [ "$DOORGAAN_KEUZE" != "n" ] && [ "$DOORGAAN_KEUZE" != "y" ]
    do
    	read -p "Wilt u verder gaan? [y/n]: " DOORGAAN_KEUZE

		if [ "$DOORGAAN_KEUZE" = "n" ]; then
			:
		elif [ "$DOORGAAN_KEUZE" = "y" ]; then
			:
		else
			echo "Geen geldige optie was gekozen"
		fi
	done
	if [ "$DOORGAAN_KEUZE" = "y" ]; then
		read -p "IP van de master: " MASTER_IP
		sudo sh install_salt.sh -A $MASTER_IP
		#Naam van minion veranderen
		sudo service salt-minion stop
		read -p "Naam van minion: " MINION_NAME
		sleep 1
		sudo rm -rf /etc/salt/minion_id
		sudo touch /etc/salt/minion_id && sudo chmod 777 /etc/salt/minion_id
		sudo printf "$MINION_NAME" > /etc/salt/minion_id
		sudo service salt-minion start
		echo "-------------------------------------------------------------------------------------"
		echo "Salt Minion has been installed"
		echo "-------------------------------------------------------------------------------------"
	
	else
		echo ""
	fi
	DOORGAAN_KEUZE='NULL'
	#Toevoegen minions
	read -p "Wilt u ALLE minions toevoegen? [y/n]: " DOORGAAN_KEUZE
	while [ "$DOORGAAN_KEUZE" != "n" ] && [ "$DOORGAAN_KEUZE" != "y" ]
    do
    	read -p "Wilt u verder gaan? [y/n]: " DOORGAAN_KEUZE

		if [ "$DOORGAAN_KEUZE" = "n" ]; then
			:
		elif [ "$DOORGAAN_KEUZE" = "y" ]; then
			:
		else
			echo "Geen geldige optie was gekozen"
		fi
	done
	if [ "$DOORGAAN_KEUZE" = "y" ]; then
		salt-key --accept-all
		echo "-------------------------------------------------------------------------------------"
		echo "All found minions have been added"
		echo "-------------------------------------------------------------------------------------"
	
	else
		echo ""
	fi
	DOORGAAN_KEUZE='NULL'
else
	#install minion
	read -p "IP van de master: " MASTER_IP
	curl -L https://bootstrap.saltstack.com -o install_salt.sh
	sudo sh install_salt.sh -A $MASTER_IP
	#Naam van minion veranderen
	sudo service salt-minion stop
	read -p "Naam van minion: " MINION_NAME
	sleep 1
	sudo rm -rf /etc/salt/minion_id
	sudo touch /etc/salt/minion_id && sudo chmod 777 /etc/salt/minion_id
	sudo printf "$MINION_NAME" > /etc/salt/minion_id
	sudo service salt-minion start
	echo "-------------------------------------------------------------------------------------"
	echo "Salt Minion has been installed"
	echo "-------------------------------------------------------------------------------------"
	
fi
echo "-------------------------------------------------------------------------------------"
echo "Salt has been installed and configured"
echo "-------------------------------------------------------------------------------------"
