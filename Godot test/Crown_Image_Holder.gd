extends Node2D

static var crownIcons = {"crown1": preload("res://Fairy Pics/1crown.png"),"crown2":preload("res://Fairy Pics/2crown.png"), "crown3":preload("res://Fairy Pics/3crown.png")}
var crownCount = 1
var crownstring
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setCrownImage(num):
	if num>3:
		num=3
	if num<1:
		num=1
	crownCount = num
	crownstring = "crown" + str(num)
	$Crown.texture = crownIcons[crownstring]
	print("Crown set"+str(crownCount))
	
func getCrownNum():
	return crownCount
		

func _on_timer_timeout():
#	if crownCount==3:
#		crownCount=0
#	crownCount+=1
#	setCrownImage(crownCount)
	pass # Replace with function body.
