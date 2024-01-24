extends Node2D

var Board
# Called when the node enters the scene tree for the first time.
func _ready():
	Board = [[$Board_Parent/Board_position1/BoardToken, $Board_Parent/Board_position2/BoardToken, $Board_Parent/Board_position3/BoardToken, $Board_Parent/Board_position4/BoardToken, $Board_Parent/Board_position5/BoardToken],
	[$Board_Parent/Board_position6/BoardToken, $Board_Parent/Board_position7/BoardToken, $Board_Parent/Board_position8/BoardToken, $Board_Parent/Board_position9/BoardToken, $Board_Parent/Board_position10/BoardToken],
	[$Board_Parent/Board_position11/BoardToken, $Board_Parent/Board_position12/BoardToken, $Board_Parent/Board_position13/BoardToken, $Board_Parent/Board_position14/BoardToken, $Board_Parent/Board_position15/BoardToken],
	[$Board_Parent/Board_position16/BoardToken, $Board_Parent/Board_position17/BoardToken, $Board_Parent/Board_position18/BoardToken, $Board_Parent/Board_position19/BoardToken, $Board_Parent/Board_position20/BoardToken],
	[$Board_Parent/Board_position21/BoardToken, $Board_Parent/Board_position22/BoardToken, $Board_Parent/Board_position23/BoardToken, $Board_Parent/Board_position24/BoardToken, $Board_Parent/Board_position25/BoardToken]]
	
	#fillSingleSlot(0,1,Enums.TokenColour.Blue)
	#fillSingleSlot(1,0,Enums.TokenColour.None)
	
	var newBoardColour = [[1,2,3,4,8],[1,2,8,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]
	fillAllSlot(newBoardColour)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fillSingleSlot(x:int,y:int,colour:Enums.TokenColour):
	var BoardToken = Board[y][x]
#	var Token = BoardToken.get_node("Token")
#	Token.changeColour(colour)
#	if colour == Enums.TokenColour.None:
#		BoardToken.EnableLights(false)
#	else:
#		BoardToken.EnableLights(true)
	BoardToken.setTokenColour(colour)
	
		
func fillAllSlot(colour:Array):
	for y in range(5):
		for x in range(5):
			fillSingleSlot(x, y, colour[y][x])
			
			
func takeAwaySelectedTokens(player:int):
	for y in range(5):
		for x in range(5):
			if Board[y][x].BoardTokenState==2:
				sendTokenToPlayer(Board[y][x], player)
				
	print("Taken")
				
				
				
func sendTokenToPlayer(tokenObj, player:int):
	tokenObj.takeAwayToken()
	
	

