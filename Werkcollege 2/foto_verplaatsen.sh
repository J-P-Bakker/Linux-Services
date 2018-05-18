#!/bin/sh
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.

echo "Geliezen de volgende parameters invullen:"
read -p "Locatie van de foto's: " FOTO_LOCATIE
read -p "Sorteren op WEEK of MAAND: " FOTO_SORTEREN

while [ "$FOTO_SORTEREN" != "WEEK" ] && [ "$FOTO_SORTEREN" != "MAAND" ]
do
	echo "Verkeerde parameter voor sorteren"
        read -p "Wilt u verder gaan? [y/n]: " DOORGAAN_KEUZE
	if [ "$DOORGAAN_KEUZE" = "n" ]; then
		exit
	else
		read -p "Sorteren op WEEK of MAAND: " FOTO_SORTEREN
	fi
done
echo "We gaan de foto's uit de map: $FOTO_LOCATIE sorteren op $FOTO_SORTEREN"
