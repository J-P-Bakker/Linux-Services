#! /bin/bash
# Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.

#Create array
myintarray=(1 4 8 16 32)
echo ${myintarray[4]}

#Add to array
myintarray[5]=64
echo ${myintarray[5]}

#Print number of items in array
echo ${myintarray[@]}

#Print all items in array
echo ${myintarray[*]}