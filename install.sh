#!/bin/bash

if python -mplatform | grep -qPi "(Ubuntu|Debian)"; then
	echo "INSTALLING DEPENDENCIES:"
	for P in $(cat DEPENDENCIES); do
		dpkg -s "$P" >/dev/null 2>&1 && {
			echo -e "\t$P is already installed"
		} || {
			echo -e "\t$P will be installed"
			echo -e "\tsudo apt-get install $P"
			sudo apt-get install $P
		}
	done
else
	echo "Dependency check could not be performed."
	echo "Continuing."
fi

echo

echo "LINKING CONFIG FILES:"

for C in $(cat CONFIGS); do
	TARGET="$HOME/.$C"

	if [ -e $TARGET ]; then
		echo -e "\t${TARGET} exists"
	else
		echo -e "\tln -sf $(realpath $C) $HOME/.$C"
		ln -sf $(realpath $C) $HOME/.$C
	fi
done

