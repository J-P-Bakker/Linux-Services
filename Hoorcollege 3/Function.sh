#! /bin/bash
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.

#Create function
timestwo () {
	(($2=$1*2))
}

read -p "Please give a number: " NUMBER1
timestwo $NUMBER1 RESULT
echo "Result: $RESULT"