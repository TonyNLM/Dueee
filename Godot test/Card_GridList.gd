extends GridContainer

var init
# Called when the node enters the scene tree for the first time.
func _ready():
	print($CenterContainer/Tier_Card.global_position)
	print($CenterContainer2/Card_Base.global_position)
	print($CenterContainer3/Card_Base.global_position)
	print($CenterContainer4/Card_Base.global_position)
	init=0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if init<10:
		print($CenterContainer/Tier_Card.global_position)
		print($CenterContainer2/Card_Base.global_position)
		print($CenterContainer3/Card_Base.global_position)
		print($CenterContainer4/Card_Base.global_position)
		init+=1
	pass
