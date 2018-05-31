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


for i in "$FOTO_LOCATIE"/*
do
	if test -f "$i"; then
		filename="${i##*/}"
		creationdate=$(ls -l --time-style='+%d-%m-%y' "$i" | awk '{print $6}')
		if [ "$FOTO_SORTEREN" = "WEEK" ]; then
			weeknum=$(date --date="$creationdate" +"%V")
			num="Week $weeknum"
		elif [ "$FOTO_SORTEREN" = "MAAND" ]; then
			monthnum=$(date --date="$creationdate" +"%m")
			num="Month $monthnum"
		fi
		
		if [ ! -d "$FOTO_LOCATIE/$num" ]; then
			mkdir "$FOTO_LOCATIE/$num"
		fi
		
		cp "$i" "$FOTO_LOCATIE/$num/$filename"

		originalhash=$(sudo md5sum "$i" | cut -d " " -f1)
		movedhash=$(sudo md5sum "$FOTO_LOCATIE/$num/$filename" | cut -d " " -f1)
		
		if [ "$originalhash" = "$movedhash" ]; then
			echo "INFO ($filename): Hashes are identical."
			echo "INFO ($filename): Proceeding to remove original file."
			sudo rm "$i"
		else
			echo "ERROR ($filename): Hashes do not match."
			echo "ERROR ($filename): Proceeding to remove copied file."
			sudo rm "$FOTO_LOCATIE/$num/$filename"
		fi
	fi
done
