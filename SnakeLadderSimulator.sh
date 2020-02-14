echo "start the game"
a1=100
b1=91
echo "======================================================="
for (( i = 1; i < 11; i++ )); do
	echo -n "|| "
	a=$a1
	b=$b1
	for (( j = 1; j < 11; j++ )); do
		if (($(($i%2))==1)); then
		echo -n " $a |"
		a=$(($a-1))

		elif (($(($i%2))==0)); then
		echo -n " $b |"
		b=$(($b+1))
		
		fi

	done
	echo "|"
echo "======================================================="
	a1=$(($a1-10))
	b1=$(($b1-10))
done
=======
function PlayerAtZero(){
	echo "enter player name"
	read name
	Display
	echo "player here '$name'"
}
function Display(){
	a1=100
	b1=91
	declare -A ladder
	echo "======================================================="
	for (( i = 1; i < 11; i++ )); do
		echo -n "|| "
		a=$a1
		b=$b1
		for (( j = 1; j < 11; j++ )); do
			if (($(($i%2))==1)); then
				echo -n " $a |"
				ladder[$i,$j]=$a
				a=$(($a-1))

			elif (($(($i%2))==0)); then
				echo -n " $b |"
				ladder[$i,$j]=$a
				b=$(($b+1))
			fi
		done
		echo "|"
		echo "======================================================="
		a1=$(($a1-10))
		b1=$(($b1-10))
	done
}
PlayerAtZero
