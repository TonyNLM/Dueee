extends Node



func _ready():
	pass

func _process(delta):
	pass
	
func fadeOutObject(obj, duration:float=2, delay:float=0, revert:bool=false, callback:Callable=nullCallback):
	var fadeTween = create_tween()
	var currentColor = obj.modulate
	var targetColor = Color(currentColor.r, currentColor.g, currentColor.b, 0)
	fadeTween.tween_property(obj, "modulate", targetColor, duration).set_delay(delay)
	if revert:
		var lambda = func():			
			obj.modulate.a = 1	
		fadeTween.tween_callback(lambda)
	if callback!=nullCallback:
		fadeTween.tween_callback(callback)
		
	
#func revertFadedObject(obj):
#	obj.modulate.a = 1

func fadeInObject(obj):
	var fadeTween = create_tween()
	var currentColor = obj.modulate
	var targetColor = Color(currentColor.r, currentColor.g, currentColor.b, 1)
	fadeTween.tween_property(obj, "modulate", targetColor, 2)

func nullCallback():
	pass


