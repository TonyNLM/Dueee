extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var BoardObj = self.get_parent().get_node("Board")
	var takeAwayToken = BoardObj.takeAwaySelectedTokens.bind(1)
	$Button_Icon.connect("pressed", takeAwayToken)
	#print("Binding Complete")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

