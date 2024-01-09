extends Node2D
class_name Token

var type:String 
static var colourIcons = {0: preload("res://Fairy Pics/gold.png"), 1:preload("res://Fairy Pics/blue.png"), 2:preload("res://Fairy Pics/red.png"), 3:preload("res://Fairy Pics/white.png"), 4:preload("res://Fairy Pics/green.png"), 5:preload("res://Fairy Pics/black.png"), 6:preload("res://Fairy Pics/pink.png"), 7:preload("res://Fairy Pics/wild.png")}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func changeColour(colour:Enums.TokenColour):
	$Icon.texture = colourIcons[colour]
	print($Icon.texture)
	



func _on_node_2d_hidden():
	pass # Replace with function body.
