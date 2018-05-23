#! /bin/bash
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.
FILENAME='sed_test.txt'
cd "/home/$SUDO_USER/Documents/git/Linux-Services/Hoorcollege 4"

if [ -f sed_test.txt ]; then
    echo "Het bestand $FILENAME bestaat al"
    while [ "$DOORGAAN_KEUZE" != "n" ] && [ "$DOORGAAN_KEUZE" != "y" ]
    do
    	read -p "Wilt u het bestaande bestand verwijderen? [y/n]: " DOORGAAN_KEUZE

		if [ "$DOORGAAN_KEUZE" = "n" ]; then
			exit
		elif [[ "$DOORGAAN_KEUZE" = "y" ]]; then
			rm -rf $FILENAME
		else
			echo "Geen geldige optie was gekozen"
			fi
	done
fi
echo 'Creating new sed_test file'
touch 'sed_test.txt'
echo 'voornaam=' >> sed_test.txt
echo 'achternaam=' >> sed_test.txt
echo 'straat=' >> sed_test.txt
echo 'huisnummer=' >> sed_test.txt
echo 'postcode=' >> sed_test.txt
echo 'Finished!'