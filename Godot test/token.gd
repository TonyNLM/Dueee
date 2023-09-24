extends Node2D
class_name Token

var type:String 
static var colorIcons = {"gold": preload("res://Fairy Pics/gold.png"), "blue":preload("res://Fairy Pics/blue.png")}

# Called when the node enters the scene tree for the first time.
func _ready():
	type = "gold"
	position = Vector2(0,0)

func changeColour(colour:String):
	$Icon.texture = colorIcons[colour]
	type = colour
	print($Icon.texture)
	



func _on_node_2d_hidden():
	pass # Replace with function body.
