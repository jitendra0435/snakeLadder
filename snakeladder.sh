	#!/bin/bash -x 
    echo "Welcome to  the program Snakeladder"

    #constants
	declare NOPLAY=0
	declare SNAKE=1
	declare LADDER=2
	declare LIMITUPTOPLAY=100
	declare RESETPOSITION=0

	#variable
	declare position=0
	declare count=0
	declare dieCounter=0
	declare -A positionReport
	
	function rollingDie(){

		dieValue=$((RANDOM%6+1))
		dieCounter=$(($dieCounter+1))
	}


		function startPlaying(){

		rollingDie

		playChoice=$((RANDOM%3))

		case $playChoice in $NOPLAY )
				possition=0;;

				$LADDER )
				position=$(( $position+$dieValue ));;

				$SNAKE )

				position=$(( $position-$dieValue ));;
		esac

		if [ $position -lt  $RESETPOSITION ]
		then
			position=0

		elif [ $position -gt $LIMITUPTOPLAY ]
		then
			position=$(( $position-$dieValue ))

			positionReport[count]=$position 
		   count=$(($count+1))
		fi

	}

	 while [ $position -lt $LIMITUPTOPLAY ]
  	 do
		if [ $position -ne  $LIMITUPTOPLAY ]
		then 
			startPlaying
		else
			break;
		fi	
	done





