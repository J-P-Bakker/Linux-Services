#! /bin/bash
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.

echo "Gelieven de volgende parameters invullen:"
read -p "Cijfer 1: " VAR1
read -p "Cijfer 2: " VAR2

# Bij elkaar optellen
let 'VAR3=VAR1+VAR2'
((VAR4=$VAR1+$VAR2))

echo "let uitkomst +: $VAR3"
echo "Haakjes uitkomst +: $VAR4"

#vermenigvuldigen
let 'VAR3=VAR1*VAR2'
((VAR4=$VAR1*$VAR2))

echo "let uitkomst *: $VAR3"
echo "Haakjes uitkomst *: $VAR4"

#Modulo
let 'VAR3=VAR1%VAR2'
((VAR4=$VAR1%$VAR2))

echo "let uitkomst %: $VAR3"
echo "Haakjes uitkomst %: $VAR4"

#machtsverheffen
let 'VAR3=VAR1**VAR2'
((VAR4=$VAR1**$VAR2))

echo "let uitkomst **: $VAR3"
echo "Haakjes uitkomst **: $VAR4"
