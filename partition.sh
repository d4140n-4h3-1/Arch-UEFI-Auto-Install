PS3='Please select a disk type: '
options=("SDA" "SDA No Swap" "NVME" "NVME No Swap" "Quit")
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
  
		"SDA No Swap")
			mkfs.fat -F32 /dev/sda1
			mkfs.ext4 /dev/sda2
			mount /dev/sda2 /mnt
			ls /mnt
		;;
  
		"NVME")
			mkfs.fat -F32 /dev/nvme0n1p1
			mkfs.ext4 /dev/nvme0n1p3
			mkswap /dev/nvme0n1p2
			mount /dev/nvme0n1p3 /mnt
			ls /mnt
			swapon /dev/nvme0n1p2
		;;

		"NVME No Swap")
			mkfs.fat -F32 /dev/nvme0n1p1
			mkfs.ext4 /dev/nvme0n1p2
			mount /dev/nvme0n1p2
			ls /mnt
		;;

		"Quit")
			break
		;;
		*) echo "Invalid Option $REPLY";;
	esac
 done
