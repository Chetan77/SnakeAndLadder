function RollDie(){
	num=$(($(($RANDOM%6))+1))
	return $num
}
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