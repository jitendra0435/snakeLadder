	 echo "Welcome to  the program Snakeladder"

   #constants  
	NOPLAY=0
	SNAKE=1
	LADDER=2
	LIMITUPTOPLAY=100
	RESETPOSITION=0
	#variable
	position=0


	function rollingDie()
   {
		dieValue=$((RANDOM%6+1))
	}


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

		if [ $position -lt $RESETPOSITION ]
		then
			position=0
		fi
	}

	while [ $position -le  $LIMITUPTOPLAY ]
	do
		rollingDie
		playingOption
	done
