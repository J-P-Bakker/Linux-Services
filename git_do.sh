#! /bin/bash
#Script gemaakt door: Jop Bakker - 359423 voor de les Linux Services aan de Hanzehogeschool Groningen.
#Script om de Linux-Services repo te downloaden, pullen of pushen
#Functions can be called from CLI: ./<scriptname> <functionname>

#Download the Linux-Services repo
download () {
	echo "Downloading the Linux-Services repo"
	cd ~/Documents/git
	git clone https://github.com/J-P-Bakker/Linux-Services.git
	echo "Finnished downloading the Linux-Services repo"
}

#Pull (updates) from git
pull () {
	echo "Pulling the Linux-Services repo"
	cd ~/Documents/git/Linux-Services
	git pull
	echo "Finnished puling Linux-Services repo"
}

#Commit and push changes to git
push () {
	echo "Commiting and pushing to the Linux-Services repo"
	cd ~/Documents/git/Linux-Services
	git add *
	read -p "Commit message: " MESSAGE
	git commit -m "$MESSAGE"
	git push
	echo "Finnished comminting to the Linux-Services repo"
}

if declare -f "$1" > /dev/null
then
  # call the function
  "$@"
else
  # Return error
  echo "'$1' is not a known function name" >&2
  exit 1
fi