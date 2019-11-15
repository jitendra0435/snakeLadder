	 echo "Welcome to  the program Snakeladder"

   #constants  
	NOPLAY=0
	SNAKE=1
	LADDER=2
	LIMITUPTOPLAY=100
	#variable
	position=0


	function rollingDie()
   {
		dieValue=$((RANDOM%6+1))
O	}


	function playingOption()
	{
		playChoice=$((RANDOM%3))

		case $playChoice in $NOPLAY )
				possition=0;;

				$LADDER )
				position=$(( $position+$dieValue ));;

				$SNAKE )
				position=$(( $position-$dieValue ));;
		esac 

		if [ $position -lt 0 ]
		then
			position=0
		fi
	}

	while [ $position -lt $LIMITUPTOPLAY ]
	do
		rollingDie
		playingOption
	done
