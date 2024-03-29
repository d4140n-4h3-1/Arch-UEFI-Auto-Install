echo "Select the Work Environment You Desire"
echo "NOTICE: This script does not cover graphical DEs. You will have to install and configure those yourself. "
# Okay, devs. This script is intended to provide fully functional systems. This means to include necessary packages
# based on how the following options are named, and avoid software that would otherwise not be used.


options=("Minimal" "Minimal Convenience" "Minimal Secure" "Minimal Performance" "Server" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		# Almost bare bones. Contains essential applications to make it usable.
		"Minimal")
			pacstrap /mnt linux linux-firmware base bash nano sudo
			break
		;;

		# The smallest an operating system should ever be. Includes printing, Bluetooth, and others right out of the box. 
		# CAUTION: Check if Linux LTS is the latest version. If not, update the next block.
		"Minimal Convenience")
			pacstrap /mnt linux-lts61 linux-firmware base blueman bluez nano network-manager sudo
			break
		;;

		# Insanely fast and equally as small. Great for PC gaming. 
		# To get the most out of Linux gaming, Radeon on Wayland is your best bet at this time.
		# Consider LabWC or Waybox.
		"Minimal Performance")
			pacstrap /mnt linux-lqx linux-firmware sway-git sudo
			break
		;;

		# This is where you want to have a smallest attack surface possible, as well as a few obstacles.
		# However, if you do not intend to connect to the web, you should not need Firejail.
		# You shouldn't need Wayland or X11 unless you intend to use a window manager.
		# Wayland is more modern and has a smaller attack surface, so it is recommended.
		"Minimal Secure")
			pacstrap /mnt linux-harden linux-firmware firejail nano network-manager
			break
		;;

		# Made for webservers. You may do away with the base package and perform maintenence or rescue mode from another live image, provided it has base and maybe base-devel.
		"Server")
			pacstrap /mnt linux-harden linux-firmware apache php nano sudo
			break
		;;

		"Quit")
			break
		;;
		*) echo "Invalid Option $REPLY";;
	esac
done
