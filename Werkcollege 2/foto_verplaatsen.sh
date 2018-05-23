#!/bin/sh
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.

echo "Geliezen de volgende parameters invullen:"
read -p "Locatie van de foto's: " FOTO_LOCATIE
read -p "Sorteren op WEEK of MAAND: " FOTO_SORTEREN

while [ "$FOTO_SORTEREN" != "WEEK" ] && [ "$FOTO_SORTEREN" != "MAAND" ]
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
	read -p "Sorteren op WEEK of MAAND: " FOTO_SORTEREN
done

echo "We gaan de foto's uit de map: $FOTO_LOCATIE sorteren op $FOTO_SORTEREN"