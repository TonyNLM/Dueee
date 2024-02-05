extends Node

var MasterController
# Called when the node enters the scene tree for the first time.
func _ready():
	MasterController = get_parent()
	MasterController.TakeTokenRequest.connect(ListenToCollectToken)
	MasterController.ClickToken.connect(ListenToTokenClick)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func ListenToTokenClick(TokenClickEvent: TokenArray):
	print(TokenClickEvent.TokenArray[0].Position)
	
func ListenToCollectToken(TokenRequestTakeEvent: TokenArray):
	var logic = true
	if logic:
		MasterController.TakeThreeToken(TokenRequestTakeEvent)
