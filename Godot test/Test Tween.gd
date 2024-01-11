extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.fadeOutObject($BoardToken)
	Utils.fadeOutObject($Card_Base)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
