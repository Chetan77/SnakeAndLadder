function RollDie(){
	num=$(($(($RANDOM%6))+1))
	return $num
}
RollDie
num=$?
