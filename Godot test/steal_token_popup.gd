extends Node2D

var TokenObjectArray
var WindowIsFold
var OriginalWindowPosition
@export var DescendDistance:int


# Called when the node enters the scene tree for the first time.
func _ready():
	TokenObjectArray = [Enums.TokenColour.Red, Enums.TokenColour.Blue, Enums.TokenColour.Green, Enums.TokenColour.White, Enums.TokenColour.Black, Enums.TokenColour.Pink]
	for i in range(6):
		var TokenElement = $Tokens.get_node("CenterContainer"+str(i)+"/Token")
		TokenElement.changeColour(TokenObjectArray[i])
		var temp_f = func returnColour():
			StealTokenSelection(TokenObjectArray[i])
		TokenElement.get_node("Button").connect("pressed", temp_f)
	
	OriginalWindowPosition = self.position
	
	
	$FoldButton.connect("pressed", FoldButtonHandler)
	UnfoldWindow()
	pass # Replace with function body.

func ShowWindow(AvailableColours):
	for i in range(6):
		var TokenElement = $Tokens.get_node("CenterContainer"+str(i)+"/Token")
		if TokenElement.SelfColour not in AvailableColours:
			TokenElement.get_parent().visible = false
		else:
			TokenElement.get_parent().visible = true
	self.visible = true	
	
	pass # Replace with function body.
func HideWindow():
	self.visible=false
	

		
func StealTokenSelection(colour:Enums.TokenColour):
	get_tree().call_group("GUIMasterController", "StealTokenSendSignal", colour)
	print(colour)
	pass
	
	
	
	
	
	
	
	
	
func FoldButtonHandler():
	if WindowIsFold:
		UnfoldWindow()
	else:
		FoldWindow()

func FoldWindow():
	self.position.y += DescendDistance
	$FoldButton/ButtonSprite.rotation = 0
	WindowIsFold = true
	
func UnfoldWindow():
	self.position.y = OriginalWindowPosition.y
	$FoldButton/ButtonSprite.rotation = PI
	WindowIsFold = false
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	pass
