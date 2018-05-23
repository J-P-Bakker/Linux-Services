#! /bin/bash
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.
FILENAME='sed_test.txt'

read -p "Voornaam: " VOORNAAM
read -p "Achternaam: " ACHERNAAM
read -p "Straatnaam: " STRAAT
read -p "Huisnummer: " HUISNUMMER
read -p "Postcode: " POSTCODE

sed -i 's/voornaam=/voornaam='"$VOORNAAM"'/' $FILENAME
sed -i 's/achternaam=/achternaam='"$ACHERNAAM"'/' $FILENAME
sed -i 's/straat=/straat='"$STRAAT"'/' $FILENAME
sed -i 's/huisnummer=/huisnummer='"$HUISNUMMER"'/' $FILENAME
sed -i 's/postcode=/postcode='"$POSTCODE"'/' $FILENAME

echo 'Finished adding chosen text'