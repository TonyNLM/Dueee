extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print($Noble_Base.noble)
	$Noble_Base.noble.nobleLoader(0)
	$Noble_Base2.noble.nobleLoader(1)
	$Noble_Base3.noble.nobleLoader(2)
	$Noble_Base4.noble.nobleLoader(3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
