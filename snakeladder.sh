  echo "Welcome to  the program Snakeladder"

	#constants  
	NOPLAY=0
	SNAKE=1
	LADDER=2
	#variable
	position=0
	function rollingDie()
   {
		dieValue=$((RANDOM%6+1))
	}
	
	rollingDie

	function playingOption()
	{
		playChoice=$((RANDOM%3))

		case $playChoice in $NOPLAY )
				possition=0;;

				$LADDER )
				position=$(( $position+$dieValue ));;

				$SNAKE )
				position=$(( $position+$dieValue ));;
		esac
	}

	playingOption
