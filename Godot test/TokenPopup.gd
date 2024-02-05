extends Node2D
var startingPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	startingPosition=self.position

	ShowPopup([3,4,5])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ShowPopup(rokenColours:Array):
	self.position = startingPosition
	var tweenMovement = create_tween()
	var spriteWidth = $Base.get_texture().get_size().x * $Base.scale.x
	##print(spriteWidth)
	var currentPosition = self.position
	var finalPosition = Vector2(get_viewport().get_size().x - spriteWidth, currentPosition.y)  
	
	# Change the final position to top-right corner
	tweenMovement.tween_property(self, "position", finalPosition, 1.5)
	tweenMovement.tween_callback(FadePopup)

func FadePopup():
	#object, duraiton, delay, need to revert?
	Utils.fadeOutObject(self, 2,1, false)
