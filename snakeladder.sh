   #!/bin/bash -x 
    echo "Welcome to  the program Snakeladder"

    #constants
	declare NOPLAY=0
	declare SNAKE=1
	declare LADDER=2
	declare LIMITUPTOPLAY=100
	declare RESETPOSITION=0

	#variable
	declare player1=0
	declare player2=0
	declare position=0
	declare count=0
	declare getplayer=0
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


			if [ $position -lt $RESETPOSITION ]
			then
				position=0

			elif [ $position -gt $LIMITUPTOPLAY ]
			then

			position=$(( $position-$dieValue ))
			fi

			positionReport[count]=$position 
		   count=$(($count+1))

		}

			function checkPlayer(){

				if [ $(( $getplayer %2 )) -eq 0 ]
				then
					player1=$position
  	   		else
					player2=$position
				fi
		  			getplayer=$(( $getplayer+1  ))

		}

			 function getWinner(){

				if [ $player2 -eq $LIMITUPTOPLAY ] 
       		then
                 echo "First player win" 
                 break;


     		   elif [ $player2 -eq $LIMITUPTOPLAY ] 
        		then  
                  echo "secound player  win"
                  break;
        		 fi
			}


   		function startGame(){

			 while [ $position -lt  $LIMITUPTOPLAY ]
  	 	  	do
				checkPlayer
				startPlaying
				getWinner

			done

			}

		startGame
