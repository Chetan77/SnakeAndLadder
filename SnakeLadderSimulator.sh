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
function RollDie(){
	num=$(($(($RANDOM%6))+1))
	return $num
}
echo "option 1 is no play
option 2 is ladder
option 3 is snake"
player1=0
function CheckForOption(){
	echo "play starts"
	input=1
	count=0
	while [[ $player1 -le 100  && $input -eq 1 ]]; do
				#echo "hhhhhhhhhhh"				
				RollDie
				rolls=$?
				count=$(($count+1))
				echo "roll is $rolls"
				option=$(($(($RANDOM%3))+1))
				echo "option is $option"
				if [[ $option -eq 1 ]]; then
					echo "No play"
					player1=$player1
					echo "player1 is at $player1 position"
				elif [[ $option -eq 2 ]]; then
					echo "ladder"
					ret=$player1
					player1=$(($player1+$rolls))
					if [[ $player1 -le 100 ]]; then
						echo "player1 is at $player1 position"
					else
						echo "player1 is staying same position "
						player1=$ret
					fi
				elif [[ $option -eq 3 && $player1 -ge 0 ]]; then
					echo "snake"
					player1=$(($player1-$rolls))
					if [[ $player1 -lt 0 ]]; then

						player1=0
					fi
					echo "player1 is at $player1 position"
				fi
				
				if [[ $player1 -eq 100 ]]; then
					echo "player1 won"
					break
				fi
				echo "to play more enter 1"
				read input
			done
			return count
		}
function NumberOfTimesDicePLayed(){
		CheckForOption
		#count=$?
		echo "Dice was played $count times"
}
NumberOfTimesDicePLayed

echo "option 1 is no play
	option 2 is ladder
	option 3 is snake"
	echo "play starts"
	player1=0
	player2=0
	player=0
	count=0
function CheckForOption(){
	player=$1
	input=1
	while [[ $player -le 100  && $input -eq 1 ]]; do
				RollDie
				rolls=$?
				count=$(($count+1))
				echo "roll is $rolls"
				option=$(($(($RANDOM%3))+1))
				echo "option is $option"
				if [[ $option -eq 1 ]]; then
					echo "No play"
					player=$player
				elif [[ $option -eq 2 ]]; then
					echo "ladder"
					ret=$player
					player=$(($player+$rolls))
					if [[ $player -le 100 ]]; then
						echo -n ""
					else
						player=$ret
					fi
				elif [[ $option -eq 3 && $player -ge 0 ]]; then
					echo "snake"
					player=$(($player-$rolls))
					if [[ $player -lt 0 ]]; then

						player=0
					fi
				fi
				return $player
			done
			return $count
		}

function GameWithTwoPlayers(){
	
	turn=1
	while [[ Position -le 100 ]]; do
		case $turn in
			1 )
				CheckForOption $player1
				player1=$player
				position=$player1
				echo "player1 is at $player1 position"
				if [[ $position -eq 100 ]]; then
					echo "player1 won"
					echo "Dice was played $count times"
					return
				fi
				echo ""
				echo "enter 2 for player2"
				echo "to exit enter other numbers"
				read turn
				#turn=2
				;;
			2 )
				CheckForOption $player2
				player2=$player
				position=$player2
				echo "player2 is at $player2 position"
				if [[ $position -eq 100 ]]; then
					echo "player2 won"
					echo "Dice was played $count times"
					return
				fi
				echo ""
				echo "enter 1 for player1"
				echo "to exit enter other numbers"
				read turn
				#turn=1
				;;
				* )
					return
		esac
	done
}
GameWithTwoPlayers