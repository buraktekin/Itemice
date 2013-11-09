#   author:	 Burak Tekin
#   Contact: iletisim@buraktekin.net
#   Created: 31 October 2013

#!/bin/bash
Line= sudo cat /usr/share/applications/$1.desktop| grep Exec=  | cut -d "=" -f2
Files=`ls /usr/share/applications | grep $1.desktop`
# if Name of the software is not entered, show usage to user.
if [ ! "$1" ]; then
	printf "\n"
	echo "Usage: addtolist <Name_of_the_Software>"
	echo "Example: addtolist sublime"
	printf "\n"

# Check whether the software already in list or not.
elif [[ "$Files" == "" ]]; then
	printf "\n"
	printf "$1 not found.\n"
	printf "\n"

# Check whether the software already in list or not.
elif [[ `sudo grep '%f' /usr/share/applications/$1.desktop` ]]; then
	printf "\n"
	printf "Already in list\n"
	printf "\n"

# if Software is not in the list, add it into the list.
else
	printf "\n"
	sudo sed -i.bak 's/Exec=/Exec= %f/' /usr/share/applications/$1.desktop #reading and replacing the specific line on the given file.
	echo "Insertion Successful."
	printf "\n"
fi