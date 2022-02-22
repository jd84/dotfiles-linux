function apt-updater {
	sudo apt update &&
	sudo apt full-upgrade -y &&
	sudo apt autoremove -y &&
	sudo apt autoclean
}

function ping-until {
	until nc -vzw 2 $1 $2; do sleep 2; done
}
