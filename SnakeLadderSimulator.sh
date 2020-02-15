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