extends Button

@export var tier:int


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", onPress)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func onPress():
	get_tree().call_group("GUIMasterController", "RequestBlindReservePopup", tier)
	
