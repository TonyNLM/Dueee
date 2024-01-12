extends Node2D
var startingPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	startingPosition=self.position
	Utils.cardLoader($Card_Base, 3)
	ShowPopup(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ShowPopup(card_num: int):
	self.position=startingPosition
	var tweenMovement = create_tween()
	var spriteWidth = $Sprite2D.get_texture().get_size().x * $Sprite2D.scale.x
	print(spriteWidth)
	var currentPosition = self.position
	var finalPosition = Vector2(0, currentPosition.y)
	tweenMovement.tween_property(self, "position", finalPosition, 1.5)
	tweenMovement.tween_callback(FadePopup)
func FadePopup():
	#object, duraiton, delay, need to revert?
	Utils.fadeOutObject(self, 2,1, false)
