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
		curl -L https://bootstrap.saltstack.com -o install_salt.sh
		sudo sh install_salt.sh -M
else
	#install minion
		read -p "IP van de master" MASTER_IP
		curl -L https://bootstrap.saltstack.com -o install_salt.sh
		sudo sh install_salt.sh -A $MASTER_IP
fi
echo "Salt has been installed"

