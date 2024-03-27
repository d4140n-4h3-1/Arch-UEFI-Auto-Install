echo "Please make a decision: "

options1=("Choice 1a" "Choice 2a" "Choice 3a")
select opt1 in "${options1[@]}"
do
	case $opt1 in
		"Choice 1a")
			echo "You made Choice 1a"
			break
		;;

		"Choice 2a")
			echo "You made Choice 2a"
			break
		;;

		"Choice 3a")
			echo "You made Choice 3a"
			break;
		;;
	esac
done

options2=("Choice 1b" "Choice 2b" "Choice 3b")
select opt2 in "${options2[@]}"
do
	case $opt2 in
		"Choice 1b")
			echo "You made Choice 1b"
			break
		;;

		"Choice 2b")
			echo "You made Choice 2b"
			break
		;;

		"Choice 3b")
			echo "You made Choice 3b"
			break
		;;
	esac
done
