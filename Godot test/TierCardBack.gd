extends Node2D

static var TierCardBackResource = {1: preload("res://Fairy Pics/tier1CardBack.png"),2: preload("res://Fairy Pics/tier2CardBack.png"), 3: preload("res://Fairy Pics/tier3CardBack.png")}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ChangeTierCardBack(num:int):
	if num<1 or num>3:
		return
	$TierCardBack_Icon.texture = TierCardBackResource[num]
