# This script assumes you have already created the necessary partitions on a fresh drive. 

PS3='Please select a disk type: '
options=("SDA" "NVME" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"SDA")
			mkfs.fat -F32 /dev/sda1
			mkfs.ext4 /dev/sda3
			mkswap /dev/sda2
			mount /dev/sda3 /mnt
			ls /mnt
			swapon /dev/sda2
		;;

		"NVME")
			mkfs.fat -F32 /dev/nvme0n1p1
			mkfs.ext4 /dev/nvme0n1p3
			mkswap /dev/nvme0n1p2
			mount /dev/nvme0n1p3 /mnt
			ls /mnt
			swapon /dev/nvme0n1p2
		;;

		"Quit")
			break
		;;
		*) echo "Invalid Option $REPLY";;
	esac
done
