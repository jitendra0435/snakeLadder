	 #!/bin/bash -x 
	 echo "Welcome to  the program Snakeladder"
	 #constant	
	declare NOPLAY=0
	declare SNAKE=1
	declare LADDER=2
	declare WINPOSITION=100
	declare RESETPOSITION=0
	declare PLAYER1=0
	declare SIDESOFDIE=6

	#variable
	declare diaValue=0
	declare player1=0
	declare player2=0
	declare position=0
	declare -A positionReport


		function rollingDie(){
			
			local dieCounter=0
			dieValue=$((RANDOM%$SIDESOFDIE+1))
			dieCounter=$(($dieCounter+1))
		}

		function startplaying(){
				
				local countPosition=0
				local choice=3

				rollingDie

				playChoice=$((RANDOM%$choice))
			
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

					elif [ $position -gt $WINPOSITION ]
						then
							position=$(( $position-$dieValue ))

					fi
		
						positionReport[countPosition]=$position 
						countPosition=$(($countPosition+1))
		}
		
		function selectplayer(){
			local choosePlayer=0
			if [ $(( $choosePlayer % 2 )) -eq $PLAYER1  ]
				then
					player1=$position
			else
					player2=$position	
			fi
	
				getplayer=$(( $choosePlayer+1  ))

		}

		function getwinner(){
			if [ $player2 -eq $WINPOSITION ] 
				then
					echo "Player1 Win" 
			break;

			elif [ $player2 -eq $WINPOSITION ] 
				then  
					echo "secound player  win"
			break;
			fi
		}


			function startGame(){

			while [ $position -lt  $WINPOSITION ]
			do
				selectplayer
				startplaying
				getwinner

			done

			}
			
			startGame
