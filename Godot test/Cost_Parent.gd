extends Node2D

static var colourCostIcons = {0: preload("res://Fairy Pics/cost_gold.png"), 1:preload("res://Fairy Pics/cost_blue.png"), 2:preload("res://Fairy Pics/cost_red.png"), 3:preload("res://Fairy Pics/cost_white.png"), 4:preload("res://Fairy Pics/cost_green.png"), 5:preload("res://Fairy Pics/cost_black.png"), 6:preload("res://Fairy Pics/cost_pink.png")}
# Called when the node enters the scene tree for the first time.
func _ready():
#	changeCostColour(Enums.TokenColour.White)
#	changeCostText(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
func changeCostColour(colour:Enums.TokenColour):
	if colour == 0:
		self.visible=false
	if colour>6 or colour<0:
		return
	self.visible=true
	$CostIcon.texture = colourCostIcons[colour]
	#print("Colour change")
	
func changeCostText(num:int):
	if num==0:
		self.visible=false
	if num<0:
		return
	self.visible =true
	$CostText.text = str(num)
