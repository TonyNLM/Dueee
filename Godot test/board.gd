extends Node2D

var Board
var newBoardColour
@export var GUIMasterController:Node
var SelectionMode:Enums.SelectionMode
# Called when the node enters the scene tree for the first time.
func _ready():
	Board = [[$Board_Parent/Board_position1/BoardToken, $Board_Parent/Board_position2/BoardToken, $Board_Parent/Board_position3/BoardToken, $Board_Parent/Board_position4/BoardToken, $Board_Parent/Board_position5/BoardToken],
	[$Board_Parent/Board_position6/BoardToken, $Board_Parent/Board_position7/BoardToken, $Board_Parent/Board_position8/BoardToken, $Board_Parent/Board_position9/BoardToken, $Board_Parent/Board_position10/BoardToken],
	[$Board_Parent/Board_position11/BoardToken, $Board_Parent/Board_position12/BoardToken, $Board_Parent/Board_position13/BoardToken, $Board_Parent/Board_position14/BoardToken, $Board_Parent/Board_position15/BoardToken],
	[$Board_Parent/Board_position16/BoardToken, $Board_Parent/Board_position17/BoardToken, $Board_Parent/Board_position18/BoardToken, $Board_Parent/Board_position19/BoardToken, $Board_Parent/Board_position20/BoardToken],
	[$Board_Parent/Board_position21/BoardToken, $Board_Parent/Board_position22/BoardToken, $Board_Parent/Board_position23/BoardToken, $Board_Parent/Board_position24/BoardToken, $Board_Parent/Board_position25/BoardToken]]
	for row in len(Board):
		for column in len(Board[row]):
			Board[row][column].BoardTokenPosition = [column, row]
	#fillSingleSlot(0,1,Enums.TokenColour.Blue)
	#fillSingleSlot(1,0,Enums.TokenColour.None)
	
	newBoardColour = [[1,2,3,4,8],[1,2,8,4,5],[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]]
	fillAllSlot(newBoardColour)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fillSingleSlot(x:int,y:int,colour:Enums.TokenColour, animation:bool=false):
	var BoardToken = Board[y][x]

#	var Token = BoardToken.get_node("Token")
#	Token.changeColour(colour)
#	if colour == Enums.TokenColour.None:
#		BoardToken.EnableLights(false)
#	else:
#		BoardToken.EnableLights(true)
	BoardToken.setTokenColour(colour)
	if animation:
		BoardToken.get_node("Token").visible=false
		get_tree().call_group("AnimationController", "SpawnTokenToBoard", BoardToken.get_node("Token"))
	
		
func fillAllSlot(colour:Array, animation:bool=false):
	for y in range(5):
		for x in range(5):
			if colour[y][x]!=Enums.TokenColour.None:
				fillSingleSlot(x, y, colour[y][x], animation)
			else:
				fillSingleSlot(x, y, colour[y][x], false)
			
			
			
#This function should no longer be used because this has no external control
func takeAwaySelectedTokens(player:int):
	for y in range(5):
		for x in range(5):
			if Board[y][x].BoardTokenState==2:
				#get_tree().call_group("AnimationController", "SpawnTokenToPlayer", Board[y][x].get_node("Token"), 1)
				sendTokenToPlayer(Board[y][x], player)
				
	#print("Taken")
				
				
				
func sendTokenToPlayer(tokenObj, player:int):
	get_tree().call_group("AnimationController", "SpawnTokenToPlayer", tokenObj.get_node("Token"), 1)
	tokenObj.takeAwayToken()
	
func RequestTakeAwayToken():
	var RequestTokenArray = TokenArray.new()
	for y in range(5):
		for x in range(5):
			if Board[y][x].BoardTokenState==2:
				print(Board[y][x])
				RequestTokenArray.AddNewTokenRecord(Board[y][x])
				
	GUIMasterController.TakeTokenRequest.emit(RequestTokenArray)

#this code should not be used in final product	
func Test_FillAllSlot():
	fillAllSlot(newBoardColour, true)
	
	
func CheckIfTokenTakable(position):
	var HighlightedTokenList=[]
	for y in range(5):
		for x in range(5):
			if Board[y][x].BoardTokenState==2:
				HighlightedTokenList.append(Board[y][x].BoardTokenPosition)
				
	if len(HighlightedTokenList)==0:
		return(true)
	elif SelectionMode == Enums.SelectionMode.SelectOne and len(HighlightedTokenList)==1:
		return(false)
	elif len(HighlightedTokenList)==1:
		for diffy in range(-1, 2):
			for diffx in range(-1, 2):
				var neighbor = [HighlightedTokenList[0][0]+diffx, HighlightedTokenList[0][1]+diffy]
				if neighbor == position:
					return true
	elif len(HighlightedTokenList)==2:
		var diffx = HighlightedTokenList[0][0]-HighlightedTokenList[1][0]
		var diffy = HighlightedTokenList[0][1]-HighlightedTokenList[1][1]
		
		if position == [HighlightedTokenList[0][0]+diffx, HighlightedTokenList[0][1]+diffy] or position == [HighlightedTokenList[1][0]-diffx, HighlightedTokenList[1][1]-diffy]:
			return(true)
	return(false)
	pass
	
	
func AlterSelectionMode(Mode:Enums.SelectionMode):
	SelectionMode = Mode
	
func ClearAllSelectedToken():
	for y in range(5):
			for x in range(5):
				if Board[y][x].BoardTokenState==2:
					Board[y][x].YellowHighlightSwitch(false)
	
	
	
func PressTokenHandler(position:Array):
	var row = position[1]
	var column = position[0]
	var BoardTokenItem = Board[row][column]
	if BoardTokenItem.BoardTokenState == 2:
		ClearAllSelectedToken()
	elif BoardTokenItem.BoardTokenState == 1:
		if(CheckIfTokenTakable(position)):
			BoardTokenItem.YellowHighlightSwitch(true)
	var clickTokenObj = TokenArray.new()
	clickTokenObj.AddNewTokenRecord(BoardTokenItem)
	GUIMasterController.ClickToken.emit(clickTokenObj)

	
	
	

